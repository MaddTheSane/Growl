/*
 Copyright (c) The Growl Project, 2004-2005
 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 3. Neither the name of Growl nor the names of its contributors
 may be used to endorse or promote products derived from this software
 without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 OF THE POSSIBILITY OF SUCH DAMAGE.
*/
//
//  GrowlMail.m
//  GrowlMail
//
//  Created by Adam Iser on Mon Jul 26 2004.
//  Copyright (c) 2004-2005 The Growl Project. All rights reserved.
//

#import "GrowlMail.h"
#import "Message+GrowlMail.h"

#define MODE_AUTO		0
#define MODE_SINGLE		1
#define MODE_SUMMARY	2

#define AUTO_THRESHOLD	10

static CFMutableArrayRef collectedMessages;

CFBundleRef GetGrowlMailBundle(void) {
	return CFBundleGetBundleWithIdentifier(CFSTR("com.growl.GrowlMail"));
}

static CFStringRef GetGrowlMailBundleVersion(void) {
	return CFBundleGetValueForInfoDictionaryKey(GetGrowlMailBundle(), kCFBundleVersionKey);
}

@implementation GrowlMail

+ (NSBundle *) bundle {
	return [NSBundle bundleWithIdentifier:@"com.growl.GrowlMail"];
}

+ (void) initialize {
	[super initialize];

	// this image is leaked
	NSImage *image = [[NSImage alloc] initByReferencingFile:[[GrowlMail bundle] pathForImageResource:@"GrowlMail"]];
	[image setName:@"GrowlMail"];

	[GrowlMail registerBundle];

	int value = 0;
	CFNumberRef automatic = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
	NSDictionary *defaultsDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"(%account) %sender", @"GMTitleFormat",
		@"%subject\n%body",    @"GMDescriptionFormat",
		automatic,             @"GMSummaryMode",
		kCFBooleanTrue,        @"GMEnableGrowlMailBundle",
		kCFBooleanFalse,       @"GMInboxOnly",
		nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaultsDictionary];
	[defaultsDictionary release];
	CFRelease(automatic);

	NSLog(@"Loaded GrowlMail %@", GetGrowlMailBundleVersion());
}

+ (BOOL) hasPreferencesPanel {
	return YES;
}

+ (NSString *) preferencesOwnerClassName {
	return @"GrowlMailPreferencesModule";
}

+ (NSString *) preferencesPanelName {
	return @"GrowlMail";
}

- (id) init {
	if ((self = [super init])) {
		CFBundleRef growlMailBundle = CFBundleGetBundleWithIdentifier(CFSTR("com.growl.GrowlMail"));
		CFURLRef privateFrameworksURL = CFBundleCopyPrivateFrameworksURL(growlMailBundle);
		CFURLRef growlBundleURL = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, privateFrameworksURL, CFSTR("Growl.framework"), true);
		CFRelease(privateFrameworksURL);
		CFBundleRef growlBundle = CFBundleCreate(kCFAllocatorDefault, growlBundleURL);
		CFRelease(growlBundleURL);
		if (growlBundle) {
			if (CFBundleLoadExecutable(growlBundle)) {
				// Register ourselves as a Growl delegate
				[GrowlApplicationBridge setGrowlDelegate:self];
				pthread_mutex_init(&queueLock, /*attr*/ NULL);
				pthread_mutex_init(&messagesLock, /*attr*/ NULL);
				messagesMap = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
				NSDictionary *infoDictionary = [GrowlApplicationBridge frameworkInfoDictionary];
				NSLog(@"Using Growl.framework %@ (%@)",
					  [infoDictionary objectForKey:@"CFBundleShortVersionString"],
					  [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey]);
			}
			CFRelease(growlBundle);
		} else {
			NSLog(@"Could not load Growl.framework, GrowlMail disabled");
		}
	}

	return self;
}

- (void) dealloc {
	if (messagesMap) {
		pthread_mutex_destroy(&queueLock);
		pthread_mutex_destroy(&messagesLock);
		CFRelease(messagesMap);
	}
	[super dealloc];
}

#pragma mark GrowlApplicationBridge delegate methods

- (NSString *) applicationNameForGrowl {
	return @"GrowlMail";
}

- (NSImage *) applicationIconForGrowl {
	return [NSImage imageNamed:@"NSApplicationIcon"];
}

- (void) setMessage:(Message *)message forId:(NSString *)messageId {
	pthread_mutex_lock(&messagesLock);
	CFDictionarySetValue(messagesMap, messageId, message);
	pthread_mutex_unlock(&messagesLock);
}

- (void) growlNotificationWasClicked:(NSString *)clickContext {
	if ([clickContext length]) {
		pthread_mutex_lock(&messagesLock);
		Message *message = (Message *)CFDictionaryGetValue(messagesMap, clickContext);
		[message retain];
		CFDictionaryRemoveValue(messagesMap, clickContext);
		pthread_mutex_unlock(&messagesLock);
		MessageViewingState *viewingState = [[MessageViewingState alloc] init];
		SingleMessageViewer *messageViewer = [[SingleMessageViewer alloc] initForViewingMessage:message showAllHeaders:NO viewingState:viewingState];
		[viewingState release];
		[message release];
		[messageViewer showAndMakeKey:YES];
		[messageViewer release];
	}
	[NSApp activateIgnoringOtherApps:YES];
}

- (void) growlNotificationTimedOut:(NSString *)clickContext {
	if ([clickContext length]) {
		pthread_mutex_lock(&messagesLock);
		CFDictionaryRemoveValue(messagesMap, clickContext);
		pthread_mutex_unlock(&messagesLock);
	}
}

- (NSDictionary *) registrationDictionaryForGrowl {
	// Register our ticket with Growl
	CFBundleRef bundle = GetGrowlMailBundle();
	CFStringRef newMailNotification = CFCopyLocalizedStringFromTableInBundle(CFSTR("New mail"), NULL, bundle, "");
	CFStringRef newJunkMailNotification = CFCopyLocalizedStringFromTableInBundle(CFSTR("New junk mail"), NULL, bundle, "");
	CFTypeRef allowedNotificationsValues[2] = {
		newMailNotification,
		newJunkMailNotification
	};
	CFArrayRef allowedNotifications = CFArrayCreate(kCFAllocatorDefault,
													allowedNotificationsValues,
													2,
													&kCFTypeArrayCallBacks);
	CFRelease(newMailNotification);
	CFRelease(newJunkMailNotification);
	int zero = 0;
	CFNumberRef default0 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &zero);
	CFArrayRef defaultNotifications = CFArrayCreate(kCFAllocatorDefault,
												   (const void **)&default0,
												   1,
												   &kCFTypeArrayCallBacks);
	CFRelease(default0);
	NSDictionary *ticket = [NSDictionary dictionaryWithObjectsAndKeys:
		(NSArray *)allowedNotifications, GROWL_NOTIFICATIONS_ALL,
		(NSArray *)defaultNotifications, GROWL_NOTIFICATIONS_DEFAULT,
		nil];
	CFRelease(allowedNotifications);
	CFRelease(defaultNotifications);

	return ticket;
}

#pragma mark -

- (void) queueMessage:(Message *)message {
	pthread_mutex_lock(&queueLock);
	if (!collectedMessages) {
		collectedMessages = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
		[self performSelectorOnMainThread:@selector(showSummary)
							   withObject:nil
							waitUntilDone:NO];
	}
	CFArrayAppendValue(collectedMessages, message);
	pthread_mutex_unlock(&queueLock);
}

- (void) showSummary {
	if (!collectedMessages)
		return;

	pthread_mutex_lock(&queueLock);

	int summaryMode = GMSummaryMode();
	if (summaryMode == MODE_AUTO) {
		if (CFArrayGetCount(collectedMessages) >= AUTO_THRESHOLD)
			summaryMode = MODE_SUMMARY;
		else
			summaryMode = MODE_SINGLE;
	}

	CFIndex count = CFArrayGetCount(collectedMessages);
	switch (summaryMode) {
		default:
		case MODE_SINGLE:
			for (CFIndex i=0; i<count; ++i) {
				Message *message = (Message *)CFArrayGetValueAtIndex(collectedMessages, i);
				[message showNotification];
			}
			break;
		case MODE_SUMMARY: {
			CFArrayRef accounts = (CFArrayRef)[MailAccount mailAccounts];
			CFIndex accountsCount = CFArrayGetCount(accounts);
			CFMutableBagRef accountSummary = CFBagCreateMutable(kCFAllocatorDefault, accountsCount, &kCFTypeBagCallBacks);
			CFMutableBagRef accountJunkSummary = CFBagCreateMutable(kCFAllocatorDefault, accountsCount, &kCFTypeBagCallBacks);
			for (CFIndex i=0; i<count; ++i) {
				Message *message = (Message *)CFArrayGetValueAtIndex(collectedMessages, i);
				MailAccount *account = [[message messageStore] account];
				CFBagAddValue([message isJunk] ? accountJunkSummary : accountSummary, account);
			}
			CFBundleRef bundle = GetGrowlMailBundle();
			CFStringRef title = CFCopyLocalizedStringFromTableInBundle(CFSTR("New mail"), NULL, bundle, "");
			CFStringRef titleJunk = CFCopyLocalizedStringFromTableInBundle(CFSTR("New junk mail"), NULL, bundle, "");
			CFStringRef format = CFCopyLocalizedStringFromTableInBundle(CFSTR("%@ \n%u new mail(s)"), NULL, bundle, "");
			id icon = [NSImage imageNamed:@"NSApplicationIcon"];
			for (CFIndex i=0; i<accountsCount; ++i) {
				MailAccount *account = (MailAccount *)CFArrayGetValueAtIndex(accounts, i);
				CFIndex summaryCount = CFBagGetCountOfValue(accountSummary, account);
				if (summaryCount) {
					CFStringRef description = CFStringCreateWithFormat(kCFAllocatorDefault, /*formatOptions*/ NULL, format, [account displayName], summaryCount);
					[GrowlApplicationBridge notifyWithTitle:(NSString *)title
												description:(NSString *)description
										   notificationName:(NSString *)title
												   iconData:icon
												   priority:0
												   isSticky:NO
											   clickContext:@""];	// non-nil click context
					CFRelease(description);
				}
				summaryCount = CFBagGetCountOfValue(accountJunkSummary, account);
				if (summaryCount) {
					CFStringRef description = CFStringCreateWithFormat(kCFAllocatorDefault, /*formatOptions*/ NULL, format, [account displayName], summaryCount);
					[GrowlApplicationBridge notifyWithTitle:(NSString *)titleJunk
												description:(NSString *)description
										   notificationName:(NSString *)titleJunk
												   iconData:icon
												   priority:0
												   isSticky:NO
											   clickContext:@""];	// non-nil click context
					CFRelease(description);
				}
			}
			CFRelease(title);
			CFRelease(titleJunk);
			CFRelease(format);
			CFRelease(accountSummary);
			break;
		}
	}

	CFRelease(collectedMessages);
	collectedMessages = NULL;
	pthread_mutex_unlock(&queueLock);
}

#pragma mark Preferences

- (BOOL) isAccountEnabled:(NSString *)path {
	BOOL isEnabled = YES;
	CFDictionaryRef accountSettings = CFPreferencesCopyAppValue(CFSTR("GMAccounts"), kCFPreferencesCurrentApplication);
	if (accountSettings) {
		CFBooleanRef value = CFDictionaryGetValue(accountSettings, path);
		if (value)
			isEnabled = CFBooleanGetValue(value);
	}
	return isEnabled;
}

- (void) setAccountEnabled:(BOOL)yesOrNo path:(NSString *)path {
	CFDictionaryRef accountSettings = CFPreferencesCopyAppValue(CFSTR("GMAccounts"), kCFPreferencesCurrentApplication);
	CFMutableDictionaryRef newSettings;
	if (accountSettings) {
		newSettings = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, accountSettings);
		CFRelease(accountSettings);
	} else
		newSettings = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
	CFDictionarySetValue(newSettings, path, yesOrNo ? kCFBooleanTrue : kCFBooleanFalse);
	CFPreferencesSetAppValue(CFSTR("GMAccounts"), newSettings, kCFPreferencesCurrentApplication);
	CFRelease(newSettings);
}

@end

BOOL GMIsEnabled(void) {
	Boolean keyExistsAndHasValidFormat;
	Boolean isEnabled = CFPreferencesGetAppBooleanValue(CFSTR("GMEnableGrowlMailBundle"), kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
	return keyExistsAndHasValidFormat ? isEnabled : NO;
}

int GMSummaryMode(void) {
	Boolean keyExistsAndHasValidFormat;
	CFIndex value = CFPreferencesGetAppIntegerValue(CFSTR("GMSummaryMode"), kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
	return keyExistsAndHasValidFormat ? value : 0;
}

BOOL GMInboxOnly(void) {
	Boolean keyExistsAndHasValidFormat;
	CFIndex value = CFPreferencesGetAppIntegerValue(CFSTR("GMInboxOnly"), kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
	return keyExistsAndHasValidFormat ? value : 0;
}

NSString *copyTitleFormatString(void) {
	return (NSString *)CFPreferencesCopyAppValue(CFSTR("GMTitleFormat"), kCFPreferencesCurrentApplication);
}

NSString *copyDescriptionFormatString(void) {
	return (NSString *)CFPreferencesCopyAppValue(CFSTR("GMDescriptionFormat"), kCFPreferencesCurrentApplication);
}
