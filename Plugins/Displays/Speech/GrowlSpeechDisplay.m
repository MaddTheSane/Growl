//
//  GrowlSpeechDisplay.m
//  Display Plugins
//
//  Created by Ingmar Stein on 15.11.04.
//  Copyright 2004-2006 The Growl Project. All rights reserved.
//

#import "GrowlSpeechDisplay.h"
#import "GrowlSpeechPrefs.h"
#import "GrowlSpeechDefines.h"
#import "GrowlPathUtilities.h"
#import "GrowlDefinesInternal.h"
#import "GrowlApplicationNotification.h"
#include "CFDictionaryAdditions.h"

@implementation GrowlSpeechDisplay

- (void) dealloc {
	[preferencePane release];
	[super dealloc];
}

- (NSPreferencePane *) preferencePane {
	if (!preferencePane)
		preferencePane = [[GrowlSpeechPrefs alloc] initWithBundle:[NSBundle bundleWithIdentifier:@"com.growl.Speech"]];
	return preferencePane;
}

- (void) displayNotification:(GrowlApplicationNotification *)notification {
	NSString *voice = nil;
	READ_GROWL_PREF_VALUE(GrowlSpeechVoicePref, GrowlSpeechPrefDomain, NSString *, &voice);
	if (voice) {
		CFMakeCollectable(voice);
		[voice autorelease];
	} else {
		voice = [NSSpeechSynthesizer defaultVoice];
	}
	NSString *title = [notification title];
	NSString *desc = [notification notificationDescription];
	
	NSString *summary = [NSString stringWithFormat:@"%@\n\n%@", title, desc];
	
	NSSpeechSynthesizer *syn = [[NSSpeechSynthesizer alloc] initWithVoice:voice];
	[syn startSpeakingString:summary];

	NSDictionary *noteDict = [notification dictionaryRepresentation];
	if (getBooleanForKey(noteDict, GROWL_SCREENSHOT_MODE)) {
		NSString *path = [[[GrowlPathUtilities screenshotsDirectory] stringByAppendingPathComponent:[GrowlPathUtilities nextScreenshotName]] stringByAppendingPathExtension:@"aiff"];
		NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
		[syn startSpeakingString:summary toURL:url];
		[url release];
	}

	[syn autorelease];

	[[NSNotificationCenter defaultCenter] postNotificationName:GROWL_NOTIFICATION_TIMED_OUT object:notification userInfo:nil];
}

- (BOOL)requiresPositioning {
	return NO;
}

@end
