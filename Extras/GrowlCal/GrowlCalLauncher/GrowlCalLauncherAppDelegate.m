//
//  GrowlCalLauncherAppDelegate.m
//  GrowlCalLauncher
//
//  Created by Daniel Siemer on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GrowlCalLauncherAppDelegate.h"

@implementation GrowlCalLauncherAppDelegate

@synthesize window = _window;

-(void)applicationDidFinishLaunching:(NSNotification *)notification
{
   if(![[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"growlcal://open"]])
      NSLog(@"Error opening GrowlCal");
   exit(0);
}

@end
