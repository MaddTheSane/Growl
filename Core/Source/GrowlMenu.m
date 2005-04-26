//
//  GrowlMenu.m
//  
//
//  Created by rudy on Sun Apr 17 2005.
//  Copyright (c) 2005 Rudy Richter. All rights reserved.
//

#import "GrowlMenu.h"
#import "GrowlPreferences.h"
#import "GrowlPathUtil.h"
#import "GrowlPluginController.h"
#import "NSGrowlAdditions.h"


#define kRestartGrowl         NSLocalizedString(@"Restart Growl", @"")
#define kStartGrowl           NSLocalizedString(@"Start Growl", @"")
#define kStopGrowl            NSLocalizedString(@"Stop Growl", @"")
#define kDefaultDisplay       NSLocalizedString(@"Default display", @"")
#define kOpenGrowlPreferences NSLocalizedString(@"Open Growl preferences...", @"")
#define kSquelchMode          NSLocalizedString(@"Squelch mode", @"")
#define kStopGrowlMenu        NSLocalizedString(@"Quit GrowlMenu", @"")


/*
 *  HelperMain.m
 *  Growl
 *
 *  Created by Karl Adam on Thu Apr 22 2004.
 *  Copyright (c) 2004 The Growl Project. All rights reserved.
 *
 */

#import "GrowlController.h"

int main(void) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	[NSApplication sharedApplication];
	
	GrowlMenu *menu = [[GrowlMenu alloc] init];
	[NSApp run];

	[menu release];
	[NSApp release];
	[pool release];

	return EXIT_SUCCESS;
}

@implementation GrowlMenu

- (id) init {
	if ((self = [super init])) {
		preferences = [GrowlPreferences preferences];

		NSMenu *m = [self buildMenu];

		statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];

		NSBundle *bundle = [NSBundle mainBundle];
		
		clawImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"tiff"]];
		clawHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon-alt" ofType:@"tiff"]];
		squelchImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"squelch" ofType:@"tiff"]];
		squelchHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"squelch-alt" ofType:@"tiff"]];

		if ([preferences boolForKey:GrowlSquelchModeKey]) {
			[statusItem setImage:squelchImage];
			[statusItem setAlternateImage:squelchHighlightImage];
		} else {
			[statusItem setImage:clawImage];
			[statusItem setAlternateImage:clawHighlightImage];
		}
		
		[statusItem setMenu:m]; // retains m
		[statusItem setToolTip:@"Growl"];
		[statusItem setHighlightMode:YES];

		[m release];

		[[NSDistributedNotificationCenter defaultCenter] addObserver:self
															selector:@selector(shutdown:)
																name:@"GrowlMenuShutdown"
															  object:nil];
	}
	return self;
}

- (void) dealloc {
	[statusItem release];
	[clawImage release];
	[clawHighlightImage release];
	[squelchImage release];
	[squelchHighlightImage release];
	[super dealloc];
}

- (void) shutdown:(NSNotification *)theNotification {
#pragma unused(theNotification)
	[NSApp terminate:self];
}

- (IBAction) openGrowl:(id)sender {
#pragma unused(sender)
	NSString *prefPane = [[GrowlPathUtil growlPrefPaneBundle] bundlePath];
	[[NSWorkspace sharedWorkspace] openFile:prefPane];
}

- (IBAction) defaultDisplay:(id)sender {
	[preferences setObject:[sender title] forKey:GrowlDisplayPluginKey];
}

- (IBAction) stopGrowl:(id)sender {
#pragma unused(sender)
	//If Growl is running, we should stop it.
	if ([preferences isGrowlRunning])
		[preferences setGrowlRunning:NO noMatterWhat:NO];
}

- (IBAction) startGrowl:(id)sender {
#pragma unused(sender)
	if (![preferences isGrowlRunning]) {
		//If Growl isn't running, we should start it.
		[preferences setGrowlRunning:YES noMatterWhat:NO];
	} else {
		//If Growl is running, we should restart it.
		//Actually, we should HUP it, but we don't.
		[preferences setGrowlRunning:NO noMatterWhat:NO];
		[preferences setGrowlRunning:YES noMatterWhat:YES];
	}
}

- (IBAction) squelchMode:(id)sender {
#pragma unused(sender)
	BOOL squelchMode = ![preferences boolForKey:GrowlSquelchModeKey];
	[preferences setBool:squelchMode forKey:GrowlSquelchModeKey];
	if (squelchMode) {
		[statusItem setImage:squelchImage];
		[statusItem setAlternateImage:squelchHighlightImage];
	} else {
		[statusItem setImage:clawImage];
		[statusItem setAlternateImage:clawHighlightImage];
	}
}

- (IBAction) quitMenuExtra:(id)sender {
#pragma unused(sender)
	NSString *growlMenuPath = [[NSBundle mainBundle] bundlePath];
	[preferences setStartAtLogin:growlMenuPath enabled:NO];
	[preferences setBool:NO forKey:GrowlMenuExtraKey];

	[NSApp terminate:self];
}

- (NSMenu *) buildMenu {
	NSMenu *m = [[NSMenu allocWithZone:[NSMenu menuZone]] init];

	NSMenuItem *tempMenuItem;

	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kStartGrowl action:@selector(startGrowl:) keyEquivalent:@""];
	[tempMenuItem setTarget:self];
	[tempMenuItem setTag:1];

	if ([preferences isGrowlRunning])
		[tempMenuItem setTitle:kRestartGrowl];

	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kStopGrowl action:@selector(stopGrowl:) keyEquivalent:@""];
	[tempMenuItem setTag:2];
	[tempMenuItem setTarget:self];
	
	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kStopGrowlMenu action:@selector(quitMenuExtra:) keyEquivalent:@""];
	[tempMenuItem setTag:5];
	[tempMenuItem setTarget:self];
	
	[m addItem:[NSMenuItem separatorItem]];

	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kSquelchMode action:@selector(squelchMode:) keyEquivalent:@""];
	[tempMenuItem setTarget:self];
	[tempMenuItem setTag:4];

	NSMenu *displays = [[NSMenu allocWithZone:[NSMenu menuZone]] init];
	NSString *name;
	NSEnumerator *displayEnumerator = [[[GrowlPluginController controller] allDisplayPlugins] objectEnumerator];
	while ((name = [displayEnumerator nextObject])) {
		tempMenuItem = (NSMenuItem *)[displays addItemWithTitle:name action:@selector(defaultDisplay:) keyEquivalent:@""];
		[tempMenuItem setTarget:self];
		[tempMenuItem setTag:3];
	}
	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kDefaultDisplay action:NULL keyEquivalent:@""];
	[tempMenuItem setTarget:self];
	[tempMenuItem setSubmenu:displays];
	[displays release];
	[m addItem:[NSMenuItem separatorItem]];

	tempMenuItem = (NSMenuItem *)[m addItemWithTitle:kOpenGrowlPreferences action:@selector(openGrowl:) keyEquivalent:@""];
	[tempMenuItem setTarget:self];

	return m;
}

- (BOOL) validateMenuItem:(NSMenuItem *)item {
	switch ([item tag]) {
		case 1:
			if ([preferences isGrowlRunning]) {
				[item setTitle:kRestartGrowl];
			} else {
				[item setTitle:kStartGrowl];
			}
			break;
		case 2:
			return [preferences isGrowlRunning];
		case 3:
			[item setState:[[item title] isEqualToString:[preferences objectForKey:GrowlDisplayPluginKey]]];
			break;
		case 4:
			[item setState:[preferences boolForKey:GrowlSquelchModeKey]];
			break;
	}
	return YES;
}

@end
