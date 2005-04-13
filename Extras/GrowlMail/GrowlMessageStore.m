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
//  GrowlMessageStore.m
//  GrowlMail
//
//  Created by Ingmar Stein on 27.10.04.
//

#import "GrowlMessageStore.h"
#import "Message+GrowlMail.h"
#import "GrowlMail.h"
#import <Growl/Growl.h>

static NSMutableArray *collectedMessages;

@implementation GrowlMessageStore
+ (void) load {
	[GrowlMessageStore poseAsClass:[MessageStore class]];
}

#define MODE_AUTO		0
#define MODE_SINGLE		1
#define MODE_SUMMARY	2

#define AUTO_THRESHOLD	10

- (void) showSummary {
	Message *message;
	int summaryMode = [GrowlMail summaryMode];
	GrowlMail *growlMail = [GrowlMail sharedInstance];

	unsigned messageCount = [collectedMessages count];
	if (summaryMode == MODE_AUTO) {
		if (messageCount >= AUTO_THRESHOLD) {
			summaryMode = MODE_SUMMARY;
		} else {
			summaryMode = MODE_SINGLE;
		}
	}

	Class tocClass = [TOCMessage class];
	NSEnumerator *e = [collectedMessages objectEnumerator];
	switch (summaryMode) {
		default:
		case MODE_SINGLE:
			while ((message = [e nextObject])) {
				// NSLog( @"Message class: %@", [message className] );
				MailAccount *account = [[message messageStore] account];
				if (!([message isKindOfClass: tocClass] || ([message isJunk] && [GrowlMail isIgnoreJunk]))
						&& [growlMail isAccountEnabled:[account path]] ) {
					[message showNotification];
				}
			}
			break;
		case MODE_SUMMARY: {
			NSMutableDictionary *accountSummary = [[NSMutableDictionary alloc] initWithCapacity:[[MailAccount mailAccounts] count]];
			while ((message = [e nextObject])) {
				// NSLog( @"Message class: %@", [message className] );
				MailAccount *account = [[message messageStore] account];
				if (!([message isKindOfClass: tocClass] || ([message isJunk] && [GrowlMail isIgnoreJunk]))
						&& [growlMail isAccountEnabled:[account path]] ) {
					NSString *accountName = [account displayName];
					NSNumber *oldCount = [accountSummary objectForKey:accountName];
					int count;
					if (oldCount) {
						count = [oldCount intValue] + 1;
					} else {
						count = 1;
					}
					NSNumber *value = [[NSNumber alloc] initWithInt:count];
					[accountSummary setObject:value forKey:accountName];
					[value release];
				}
			}
			NSEnumerator *enumerator = [accountSummary keyEnumerator];
			NSBundle *bundle = [GrowlMail bundle];
			NSString *title = NSLocalizedStringFromTableInBundle(@"New mail", nil, bundle, @"");
			NSData *iconData = [[NSImage imageNamed:@"NSApplicationIcon"] TIFFRepresentation];
			Class gab = [GrowlMail growlApplicationBridge];
			NSString *key;
			while ((key = [enumerator nextObject])) {
				NSNumber *count = [accountSummary objectForKey:key];
				NSString *description = [NSString stringWithFormat:NSLocalizedStringFromTableInBundle(@"%@ \n%d new mail(s)", nil, bundle, @""), key, [count intValue]];
				[gab notifyWithTitle:title
						 description:description
					notificationName:NSLocalizedStringFromTableInBundle(@"New mail", nil, [GrowlMail bundle], @"")
							iconData:iconData
							priority:0
							isSticky:NO
						clickContext:@""];	// non-nil click context
			}
			[accountSummary release];
			break;
		}
	}

	[collectedMessages release];
	collectedMessages = nil;
}

- (id) finishRoutingMessages:(NSArray *)messages routed:(NSArray *)routed {
	if ([GrowlMail isEnabled]) {
		if (!collectedMessages) {
			collectedMessages = [[NSMutableArray alloc] init];
			[self performSelector:@selector(showSummary)
					   withObject:nil
					   afterDelay:0.0];
		}
		[collectedMessages addObjectsFromArray:messages];
	}

	return [super finishRoutingMessages: messages routed: routed];
}

@end
