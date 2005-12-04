//
//  GrowlFlippingWindowTransition.m
//  Growl
//
//  Created by Jamie Kirkpatrick on 04/12/2005.
//  Copyright 2004-2005 The Growl Project. All rights reserved.
//

#import "GrowlFlippingWindowTransition.h"
#import "NSWindow+Transforms.h"

@implementation GrowlFlippingWindowTransition

- (id) initWithWindow:(NSWindow *)inWindow {
	self = [super initWithWindow:inWindow];
	if (!self)
		return nil;
	
	flipsX = NO;
	flipsY = NO;
	
	return self;
}

- (void) drawTransitionWithWindow:(NSWindow *)aWindow progress:(GrowlAnimationProgress)progress {
	if (aWindow) {
		switch (direction) {
			case GrowlForwardTransition:
				[aWindow setScaleX:(flipsX ? progress : 1.0) Y:(flipsY ? progress : 1.0)];
				break;
			case GrowlReverseTransition:
				[aWindow setScaleX:(flipsX ? 1.0 - progress : 1.0) Y:(flipsY ? 1.0 - progress : 1.0)];
				break;
			default:
				break;
		}
	}
}

#pragma mark -

- (void) startAnimation {
	if (!flipsX && !flipsY )
		return;
	
	[super startAnimation];
}

- (void) stopAnimation {
	if (!flipsX && !flipsY )
		return;
	
	[super stopAnimation];
}

#pragma mark -
#pragma mark accessors

- (BOOL) flipsX {
    return flipsX;
}

- (void) setFlipsX: (BOOL) flag {
    flipsX = flag;
}

- (BOOL) flipsY {	
    return flipsY;
}

- (void) setFlipsY: (BOOL) flag {
    flipsY = flag;
}


@end
