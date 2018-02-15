//
//  HardwareGrowlPlugin.h
//  HardwareGrowler
//
//  Created by Daniel Siemer on 5/2/12.
//  Copyright (c) 2012 The Growl Project, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HWGrowlPluginProtocol;
@protocol HWGrowlPluginNotifierProtocol;

@protocol HWGrowlPluginControllerProtocol <NSObject>
@required
-(void)notifyWithName:(NSString*)name 
				title:(NSString*)title
		  description:(NSString*)description
				 icon:(NSData*)iconData
	 identifierString:(NSString*)identifier
		contextString:(NSString*)context
			   plugin:(id<HWGrowlPluginProtocol, HWGrowlPluginNotifierProtocol>)plugin;

-(BOOL)onLaunchEnabled;
-(BOOL)pluginDisabled:(id<HWGrowlPluginProtocol, HWGrowlPluginNotifierProtocol>)plugin;

@end

@protocol HWGrowlPluginProtocol <NSObject>
@required
-(void)setDelegate:(id<HWGrowlPluginControllerProtocol>)aDelegate;
-(id<HWGrowlPluginControllerProtocol>)delegate;
-(NSString*)pluginDisplayName;
-(NSImage*)preferenceIcon;
-(NSView*)preferencePane;

@optional
-(void)startObserving;
-(void)stopObserving;
-(BOOL)enabledByDefault;

@end

@protocol HWGrowlPluginNotifierProtocol <NSObject>
@required
-(NSArray<NSString*>*)noteNames;
-(NSDictionary<NSString*,NSString*>*)localizedNames;
-(NSDictionary<NSString*,NSString*>*)noteDescriptions;
-(NSArray<NSString*>*)defaultNotifications;

@optional
-(void)postRegistrationInit;
-(void)fireOnLaunchNotes;
-(void)noteClosed:(NSString*)contextString byClick:(BOOL)clicked;

@end

/* Used for purely stat monitoring plugins */
@protocol HWGrowlPluginMonitorProtocol <NSObject>
@optional
-(NSView*)menuBarSizedView;
-(NSView*)menuViewOfWidth:(CGFloat)width;

@end
