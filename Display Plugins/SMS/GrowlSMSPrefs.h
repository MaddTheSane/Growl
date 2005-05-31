//
//  GrowlSMSMePrefs.h
//  Display Plugins
//
//  Copyright 2005 Diggory Laycock All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>

@interface GrowlSMSPrefs: NSPreferencePane {
}

- (NSString *) getAccountName;
- (void) setAccountName:(NSString *)value;

- (NSString *) getAccountAPIID;
- (void) setAccountAPIID:(NSString *)value;

- (NSString *) getDestinationNumber;
- (void) setDestinationNumber:(NSString *)value;


- (NSString *) accountPassword;
- (void) setAccountPassword:(NSString *)value;

@end
