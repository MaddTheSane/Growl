//
//  AppDelegate.m
//  TestHarness
//
//  Created by Kevin Ballard on 9/29/04.
//  Copyright 2004 TildeSoft. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
- (id) init {
	if (self = [super init]) {
		// Initialize variables
		plugins = nil;
		song = @"";
		album = @"";
		artist = @"";
		
		// find all the GrowlTunes plugins
		NSString *growlTunesPath = [[NSWorkspace sharedWorkspace] fullPathForApplication:@"GrowlTunes"];
		if (growlTunesPath) {
			NSMutableArray *array = [NSMutableArray array];
			NSBundle *growlTunesBundle = [NSBundle bundleWithPath:growlTunesPath];
			NSString *pluginsPath = [growlTunesBundle builtInPlugInsPath];
			NSArray *pluginsArray = [[NSFileManager defaultManager] directoryContentsAtPath:pluginsPath];
			NSEnumerator *e = [pluginsArray objectEnumerator];
			NSString *path;
			while (path = [e nextObject]) {
				if ([path hasSuffix:@".plugin"]) {
					NSBundle *bundle = [NSBundle bundleWithPath:
													[pluginsPath stringByAppendingPathComponent:path]];
					NSMutableDictionary *dict = [NSMutableDictionary dictionary];
					[dict setValue:bundle forKey:@"bundle"];
					[array addObject:dict];
				}
			}
			[self setPlugins:array];
		}
	}
	return self;
}

- (void) dealloc {
	[pluginsController removeObserver:self forKeyPath:@"selection"];
	
	[plugins release];
	
	[super dealloc];
}

- (void) awakeFromNib {
	// Set up drag&drop for the window here
	[mainWindow registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
	NSSortDescriptor *sortDesc = [NSSortDescriptor alloc];
	[sortDesc initWithKey:@"bundle.localizedInfoDictionary.CFBundleName" ascending:YES];
	[pluginsController setSortDescriptors:[NSArray arrayWithObject:sortDesc]];
	[pluginsController addObserver:self forKeyPath:@"selection" options:0 context:nil];
	[pluginsController rearrangeObjects];
}

- (NSArray *) plugins {
	return [[plugins retain] autorelease];
}

- (void) setPlugins:(NSArray *)array {
	[plugins autorelease];
	plugins = [array copy];
}

- (NSImage *) currentImage {
	return [[currentImage retain] autorelease];
}

- (void) setCurrentImage:(NSImage *)image {
	[currentImage autorelease];
	currentImage = [image retain];
}

// - artist:
- (NSString *)artist
{
    return [[artist retain] autorelease]; 
}

// - setArtist:
- (void)setArtist:(NSString *)anArtist
{
    [anArtist retain];
    [artist release];
    artist = anArtist;
	
	[self testPlugin];
}

// - album:
- (NSString *)album
{
    return [[album retain] autorelease]; 
}

// - setAlbum:
- (void)setAlbum:(NSString *)anAlbum
{
    [anAlbum retain];
    [album release];
    album = anAlbum;
	
	[self testPlugin];
}

// - song:
- (NSString *)song
{
    return [[song retain] autorelease]; 
}

// - setSong:
- (void)setSong:(NSString *)aSong
{
    [aSong retain];
    [song release];
    song = aSong;
	
	[self testPlugin];
}

- (void) testPlugin {
	id selection = [[pluginsController selectedObjects] lastObject];
	if (selection) {
		id <GrowlTunesPlugin> obj = [selection valueForKey:@"instance"];
		if (!obj) {
			obj = [[[selection valueForKey:@"bundle"] principalClass] new];
			[selection setValue:obj forKey:@"instance"];
		}
		if (obj) {
			[self setCurrentImage:[obj artworkForTitle:song byArtist:artist onAlbum:album]];
		} else {
			NSBeep();
		}
	} else {
		NSBeep();
	}
}

- (void) addPlugin:(NSString *)path {
	NSBundle *bundle = [NSBundle bundleWithPath:path];
	// Make sure it doesn't already exist
	NSArray *dicts = [pluginsController valueForKey:@"arrangedObjects"];
	NSEnumerator *e = [dicts objectEnumerator];
	id obj;
	while (obj = [e nextObject]) {
		if ([[obj valueForKey:@"bundle"] isEqual:bundle]) {
			[pluginsController setSelectedObjects:[NSArray arrayWithObject:obj]];
			return;
		}
	}
	if (bundle && [[bundle principalClass]
							instancesRespondToSelector:@selector(artworkForTitle:byArtist:onAlbum:)]) {
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		[dict setValue:bundle forKey:@"bundle"];
		[pluginsController addObject:dict];
		[pluginsController rearrangeObjects];
	} else {
		NSBeep();
	}
}

- (IBAction) open:(id)sender {
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	
	if ([openPanel runModalForTypes:[NSArray arrayWithObject:@"plugin"]] == NSOKButton) {
		[self addPlugin:[openPanel filename]];
	}
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([object isEqual:pluginsController] && [keyPath isEqualToString:@"selection"]) {
		[self testPlugin];
	}
}

#pragma mark -
#pragma mark Window delegate methods
// Window delegate methods
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard = [sender draggingPasteboard];
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard = [sender draggingPasteboard];
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
		NSArray *paths = [pboard propertyListForType:NSFilenamesPboardType];
		NSEnumerator *e = [paths objectEnumerator];
		NSString *path;
		while (path = [e nextObject]) {
			[self addPlugin:path];
		}
		return YES;
    }
    return NO;
}

@end
