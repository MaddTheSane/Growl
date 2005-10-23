//
//  NSWorkspaceAdditions.h
//  Growl
//
//  Created by Ingmar Stein on 16.05.05.
//  Copyright 2005 The Growl Project. All rights reserved.
//
// This file is under the BSD License, refer to License.txt for details

#import <Cocoa/Cocoa.h>

@interface NSWorkspace (GrowlAdditions)
- (NSImage *) iconForApplication:(NSString *) inName;
- (NSDictionary *) launchedApplicationWithIdentifier:(NSString *) identifier;
@end
