//
//  GrowlMusicVideoWindowController.h
//  Display Plugins
//
//  Created by Jorge Salvador Caffarena on 09/09/04.
//  Copyright 2004 Jorge Salvador Caffarena. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GrowlMusicVideoWindowController : NSWindowController {
	id				_delegate;
	NSTimer			*_animationTimer;
	BOOL			_autoFadeOut;
	BOOL			_doFadeIn;
	SEL				_action;
	id				_target;
	id				_representedObject;
	short			_displayTime;
	float			topLeftPosition;
	float			timerInterval;
	float			fadeIncrement;
	int				_priority;
}

+ (GrowlMusicVideoWindowController *)musicVideo;
+ (GrowlMusicVideoWindowController *)musicVideoWithTitle:(NSString *)title text:(id)text
		icon:(NSImage *)icon priority:(int)priority sticky:(BOOL)sticky;

- (id)initWithTitle:(NSString *)title text:(id)text icon:(NSImage *)icon priority:(int)priority sticky:(BOOL)sticky;

- (void)startFadeIn;
- (void)startFadeOut;
- (void)stopFadeOut;

- (BOOL)automaticallyFadeOut;
- (void)setAutomaticallyFadesOut:(BOOL) autoFade;

- (id)target;
- (void)setTarget:(id)object;

- (SEL)action;
- (void)setAction:(SEL)selector;

- (id)representedObject;
- (void)setRepresentedObject:(id)object;

- (id)delegate;
- (void)setDelegate:(id)delegate;

- (int)priority;
- (void)setPriority:(int)newPriority;

@end

@interface NSObject (GrowlMusicVideoWindowControllerDelegate)
- (void)musicVideoWillFadeIn:(GrowlMusicVideoWindowController *)musicVideo;
- (void)musicVideoDidFadeIn:(GrowlMusicVideoWindowController *)musicVideo;

- (void)musicVideoWillFadeOut:(GrowlMusicVideoWindowController *)musicVideo;
- (void)musicVideoDidFadeOut:(GrowlMusicVideoWindowController *)musicVideo;
@end