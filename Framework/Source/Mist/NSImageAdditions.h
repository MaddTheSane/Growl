//
//  NSImageAdditions.h
//
//  Created by Rachel Blackman on 7/13/11.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (GrowlAdditions)

#if 0
- (void) drawInRect:(NSRect)rect;
#endif

- (NSImage *) flippedImage;
- (NSImage *) imageSizedToDimension:(int)dimension;
- (NSImage *) imageSizedToDimensionScalingUp:(int)dimension;
- (NSImage *) imageSizedToDimensionSquaring:(int)dimension;


@end
