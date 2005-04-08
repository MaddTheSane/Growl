//
//  �PROJECTNAME�DisplayController.m
//  �PROJECTNAME�
//
//  Created by �FULLUSERNAME� on �DATE�.
//  Copyright �YEAR� �ORGANIZATIONNAME�. All rights reserved.
//

#import "�PROJECTNAME�DisplayController.h"
#import "�PROJECTNAME�DisplayPreferences.h"

@implementation �PROJECTNAMEASIDENTIFIER�DisplayController
- (void) dealloc {
	[prefPane release];
	[super dealloc];
}

- (NSPreferencePane *) preferencePane {
	// return nil if your display plugin has no preferences
	if (!prefPane) {
		prefPane = [[�PROJECTNAMEASIDENTIFIER�DisplayPreferences alloc] initWithBundle:[NSBundle bundleForClass:[�PROJECTNAMEASIDENTIFIER�DisplayPreferences class]]];
	}
	return prefPane;
}

- (void) displayNotificationWithInfo:(NSDictionary *)noteDict {
	// do something with noteDict
}
@end
