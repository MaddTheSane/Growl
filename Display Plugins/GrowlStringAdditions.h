//
//  GrowlStringAdditions.h
//  Display Plugins
//
//  Created by Matthew Walton on 27/09/2004.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSString (GrowlStringAdditions)

- (void)drawWithEllipsisInRect:(NSRect)rect withAttributes:(NSDictionary *)attributes;

@end
