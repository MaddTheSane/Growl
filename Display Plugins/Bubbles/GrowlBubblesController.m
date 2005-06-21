//
//  GrowlBubblesController.m
//  Growl
//
//  Created by Nelson Elhage on Wed Jun 09 2004.
//  Name changed from KABubbleController.h by Justin Burns on Fri Nov 05 2004.
//  Copyright (c) 2004 Nelson Elhage. All rights reserved.
//

#import "GrowlBubblesController.h"
#import "GrowlBubblesWindowController.h"
#import "GrowlBubblesPrefsController.h"
#import "NSDictionaryAdditions.h"

@implementation GrowlBubblesController

#pragma mark -

- (void) dealloc {
	[preferencePane      release];
	[clickHandlerEnabled release];
	[super dealloc];
}

- (NSPreferencePane *) preferencePane {
	if (!preferencePane)
		preferencePane = [[GrowlBubblesPrefsController alloc] initWithBundle:[NSBundle bundleWithIdentifier:@"com.Growl.Bubbles"]];
	return preferencePane;
}

- (void) displayNotificationWithInfo:(NSDictionary *) noteDict {
	clickHandlerEnabled = [[noteDict objectForKey:@"ClickHandlerEnabled"] retain];
	GrowlBubblesWindowController *nuBubble = [[GrowlBubblesWindowController alloc]
		initWithTitle:[noteDict objectForKey: GROWL_NOTIFICATION_TITLE]
				 text:[noteDict objectForKey: GROWL_NOTIFICATION_DESCRIPTION]
				 icon:[noteDict objectForKey: GROWL_NOTIFICATION_ICON]
			 priority:[noteDict integerForKey:GROWL_NOTIFICATION_PRIORITY]
			   sticky:[noteDict boolForKey:   GROWL_NOTIFICATION_STICKY]
		   identifier:[noteDict objectForKey: GROWL_NOTIFICATION_IDENTIFIER]];
	[nuBubble setTarget:self];
	[nuBubble setAction:@selector(bubbleClicked:)];
	[nuBubble setAppName:[noteDict objectForKey:GROWL_APP_NAME]];
	[nuBubble setAppPid:[noteDict objectForKey:GROWL_APP_PID]];
	[nuBubble setClickContext:[noteDict objectForKey:GROWL_NOTIFICATION_CLICK_CONTEXT]];
	[nuBubble setScreenshotModeEnabled:[noteDict boolForKey:GROWL_SCREENSHOT_MODE]];
	[nuBubble startFadeIn];	// retains nuBubble
	[nuBubble release];
}

- (void) bubbleClicked:(GrowlBubblesWindowController *)controller {
	id clickContext;

	if ((clickContext = [controller clickContext])) {
		NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
			clickHandlerEnabled, @"ClickHandlerEnabled",
			clickContext,        GROWL_KEY_CLICKED_CONTEXT,
			[controller appPid], GROWL_APP_PID,
			nil];
		[[NSNotificationCenter defaultCenter] postNotificationName:GROWL_NOTIFICATION_CLICKED
														   object:[controller appName]
														  userInfo:userInfo];
		[userInfo release];

		//Avoid duplicate click messages by immediately clearing the clickContext
		[controller setClickContext:nil];
	}
}

@end
