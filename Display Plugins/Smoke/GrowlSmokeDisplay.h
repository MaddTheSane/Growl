//
//  GrowlSmokeDisplay.h
//  Display Plugins
//
//  Created by Matthew Walton on 09/09/2004.
//  Copyright 2004 The Growl Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GrowlDisplayProtocol.h>

@class NSPreferencePane;

@interface GrowlSmokeDisplay : NSObject <GrowlDisplayPlugin> {
  NSPreferencePane *preferencePane;
}

- (void) loadPlugin;
- (void) unloadPlugin;

- (NSString *) name;
- (NSString *) userDescription;
- (NSString *) author;
- (NSString *) version;
- (NSDictionary *) pluginInfo;

- (void) displayNotificationWithInfo:(NSDictionary *)noteDict;
- (void) _smokeGone:(NSNotification *)note;

@end
