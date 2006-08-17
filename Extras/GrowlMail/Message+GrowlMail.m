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
//  Message+GrowlMail.m
//  GrowlMail
//
//  Created by Ingmar Stein on 27.10.04.
//

#import "Message+GrowlMail.h"
#import "GrowlMail.h"
#import <AddressBook/AddressBook.h>
#import <Growl/Growl.h>

static CFStringRef createStringByReplacingKeywords(CFStringRef format, CFStringRef *keywords, CFStringRef *values, CFIndex count) {
	CFMutableStringRef text = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, format);
	for (CFIndex i=0; i<count; ++i)
		CFStringFindAndReplace(text, keywords[i], values[i], CFRangeMake(0, CFStringGetLength(text)), 0);
	return text;
}

static void trimStringToFirstNLines(CFMutableStringRef str, unsigned n) {
	CFRange range;
	CFIndex end;
	CFIndex length;

	range.location = 0;
	range.length = 0;
	for (unsigned i=0U; i<n; ++i)
		CFStringGetLineBounds(str, range, NULL, &range.location, &end);

	length = CFStringGetLength(str);
	if (length > end)
		CFStringDelete(str, CFRangeMake(end, length-end));
}

@implementation Message(GrowlMail)
- (void) showNotification {
	CFStringRef account = (CFStringRef)[[[self mailbox] account] displayName];
	NSString *sender = [self sender];
	NSString *senderAddress = [sender uncommentedAddress];
	CFStringRef subject = (CFStringRef)[self subject];
	CFStringRef body;
	CFStringRef titleFormat = copyTitleFormatString();
	CFStringRef descriptionFormat = copyDescriptionFormatString();

	if (CFStringFind(titleFormat, CFSTR("%body"), 0).location != kCFNotFound ||
			CFStringFind(descriptionFormat, CFSTR("%body"), 0).location != kCFNotFound) {
		/* We will need the body */
		MessageBody *messageBody = [self messageBody];
	
		if (messageBody) {
			NSString *originalBody;
			/* The stringForIndexing selector is not available in Mail.app 2.0. */
			if ([messageBody respondsToSelector:@selector(stringForIndexing)])
				originalBody = [messageBody stringForIndexing];
			else
				originalBody = [messageBody stringValueForJunkEvaluation:NO];
			CFMutableStringRef transformedBody = CFStringCreateMutableCopy(kCFAllocatorDefault, CFStringGetLength((CFStringRef)originalBody), (CFStringRef)originalBody);
			CFStringTrimWhitespace(transformedBody);
			CFIndex lengthWithoutWhitespace = CFStringGetLength(transformedBody);
			trimStringToFirstNLines(transformedBody, 4);
			CFIndex length = CFStringGetLength(transformedBody);
			if (length > 200) {
				CFStringDelete(transformedBody, CFRangeMake(200, length-200));
				length = 200;
			}
			if (length != lengthWithoutWhitespace)
				CFStringAppendCString(transformedBody, "\xE2\x80\xA6", kCFStringEncodingUTF8);
			body = (CFStringRef)transformedBody;
		} else {
			body = CFSTR("");
		}
	} else
		body = CFSTR("");

	/* The fullName selector is not available in Mail.app 2.0. */
	if ([sender respondsToSelector:@selector(fullName)])
		sender = [sender fullName];
	else if ([sender addressComment])
		sender = [sender addressComment];

	CFStringRef keywords[4] = {
		CFSTR("%sender"),
		CFSTR("%subject"),
		CFSTR("%body"),
		CFSTR("%account")
	};
	CFStringRef values[4] = {
		(CFStringRef)sender,
		subject,
		body,
		account
	};
	CFStringRef title = createStringByReplacingKeywords(titleFormat, keywords, values, 4);
	CFRelease(titleFormat);
	CFStringRef description = createStringByReplacingKeywords(descriptionFormat, keywords, values, 4);
	CFRelease(descriptionFormat);

	/*
	NSLog(@"Subject: '%@'", subject);
	NSLog(@"Sender: '%@'", sender);
	NSLog(@"Account: '%@'", account);
	NSLog(@"Body: '%@'", body);
	*/

	CFRelease(body);

	/*
	 * MailAddressManager fetches images asynchronously so they might arrive
	 * after we have sent our notification.
	 */
	/*
	MailAddressManager *addressManager = [MailAddressManager addressManager];
	[addressManager fetchImageForAddress:senderAddress];
	NSImage *image = [addressManager imageForMailAddress:senderAddress];
	*/
	ABSearchElement *personSearch = [ABPerson searchElementForProperty:kABEmailProperty
																 label:nil
																   key:nil
																 value:senderAddress
															comparison:kABEqualCaseInsensitive];

	NSData *image = nil;
	NSEnumerator *matchesEnum = [[[ABAddressBook sharedAddressBook] recordsMatchingSearchElement:personSearch] objectEnumerator];
	ABPerson *person;
	while ((!image) && (person = [matchesEnum nextObject]))
		image = [person imageData];

	//no matches in the Address Book with an icon, so use Mail's icon instead.
	if (!image)
		image = [[NSImage imageNamed:@"NSApplicationIcon"] TIFFRepresentation];

	CFStringRef notificationName = CFCopyLocalizedStringFromTableInBundle(
		[self isJunk] ? CFSTR("New junk mail") : ([self respondsToSelector:@selector(type)] && [self type] == MESSAGE_TYPE_NOTE) ? CFSTR("New note") : CFSTR("New mail"),
		NULL, GetGrowlMailBundle(), "");

	NSString *clickContext = [self messageID];

	[GrowlApplicationBridge notifyWithTitle:(NSString *)title
								description:(NSString *)description
						   notificationName:(NSString *)notificationName
								   iconData:image
								   priority:0
								   isSticky:NO
							   clickContext:clickContext];	// non-nil click context
	CFRelease(notificationName);
}
@end
