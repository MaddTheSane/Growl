//
//  NSGrowlAdditions.m
//  Growl
//
//  Created by Karl Adam on Fri May 28 2004.
//  Copyright 2004 The Growl Project. All rights reserved.
//
// This file is under the BSD License, refer to License.txt for details

#import "NSGrowlAdditions.h"

#pragma mark Foundation

@implementation NSString (GrowlAdditions)

+ (NSString *) stringWithUTF8String:(const char *)bytes length:(unsigned)len {
	return [[[NSString alloc] initWithUTF8String:bytes length:len] autorelease];
}

- (id) initWithUTF8String:(const char *)bytes length:(unsigned)len {
	return [self initWithBytes:bytes length:len encoding:NSUTF8StringEncoding];
}

- (BOOL) boolValue {
	return [self intValue];
}

- (void) drawWithEllipsisInRect:(NSRect)rect withAttributes:(NSDictionary *)attributes {
	// use the built-in ellipsising system if possible
	NSParagraphStyle *paragraphStyle = [attributes objectForKey:NSParagraphStyleAttributeName];
	
	if (!paragraphStyle) {
		paragraphStyle = [NSParagraphStyle defaultParagraphStyle];
	}
	
	NSMutableParagraphStyle *ellipsisingStyle = [[paragraphStyle mutableCopy] autorelease];
	[ellipsisingStyle setLineBreakMode:NSLineBreakByTruncatingTail];
	
	NSMutableDictionary *md = [NSMutableDictionary dictionaryWithDictionary:attributes];
	[md setObject:ellipsisingStyle forKey:NSParagraphStyleAttributeName];
	[self drawInRect:rect withAttributes:md];
}

@end

#pragma mark -

#define _CFURLAliasDataKey  @"_CFURLAliasData"
#define _CFURLStringKey     @"_CFURLString"
#define _CFURLStringTypeKey @"_CFURLStringType"

@implementation NSURL (GrowlAdditions)

//'alias' as in the Alias Manager.
+ fileURLWithAliasData:(NSData *)aliasData {
	NSParameterAssert(aliasData != nil);

	NSURL *URL = nil;

	AliasHandle alias = NULL;
	OSStatus err = PtrToHand([aliasData bytes], (Handle *)&alias, [aliasData length]);
	if (err != noErr) {
		NSLog(@"in +[NSURL(GrowlAdditions) fileURLWithAliasData:]: Could not allocate an alias handle from %u bytes of alias data (data follows) because PtrToHand returned %li\n%@", [aliasData length], aliasData, (long)err);
	} else {
		FSRef fsref;
		Boolean nobodyCares;
		err = FSResolveAlias(/*fromFile*/ NULL, alias, &fsref, /*wasChanged*/ &nobodyCares);
		if (err != noErr) {
			if (err != fnfErr) { //ignore file-not-found; it's harmless
				NSLog(@"in +[NSURL(GrowlAdditions) fileURLWithAliasData:]: Could not resolve alias (alias data follows) because FSResolveAlias returned %li - will try path\n%@", (long)err, aliasData);
			}
		} else {
			URL = [(NSURL *)CFURLCreateFromFSRef(kCFAllocatorDefault, &fsref) autorelease];
		}
	}

	return URL;
}
- (NSData *)aliasData {
	//return nil for non-file: URLs.
	if ([[self scheme] caseInsensitiveCompare:@"file"] != NSOrderedSame)
		return nil;

	NSData       *aliasData = nil;

	FSRef fsref;
	if (CFURLGetFSRef((CFURLRef)self, &fsref)) {
		AliasHandle alias = NULL;
		OSStatus    err   = FSNewAlias(/*fromFile*/ NULL, &fsref, &alias);
		if (err != noErr) {
			NSLog(@"in -[NSURL(GrowlAdditions) dockDescription]: FSNewAlias for %@ returned %li", self, (long)err);
		} else {
			HLock((Handle)alias);

			aliasData = [NSData dataWithBytes:*alias length:GetHandleSize((Handle)alias)];

			HUnlock((Handle)alias);
			DisposeHandle((Handle)alias);
		}
	}

	return aliasData;
}

//these are the type of external representations used by Dock.app.
+ fileURLWithDockDescription:(NSDictionary *)dict {
	NSURL *URL = nil;

	NSString *path      = [dict objectForKey:_CFURLStringKey];
	NSData   *aliasData = [dict objectForKey:_CFURLAliasDataKey];

	if (aliasData) 
		URL = [self fileURLWithAliasData:aliasData];

	if (!URL) {
		if (path) {
			NSNumber *pathStyleNum = [dict objectForKey:_CFURLStringTypeKey];
			CFURLPathStyle pathStyle = pathStyleNum ? [pathStyleNum intValue] : kCFURLPOSIXPathStyle;

			BOOL isDir = YES;
			BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];

			if (exists) {
				URL = [(NSURL *)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, pathStyle, /*isDirectory*/ isDir) autorelease];
			}
		}
	}

	return URL;
}

- (NSDictionary *)dockDescription {
	NSDictionary *dict      = nil;
	NSString *path      = [self path];
	NSData   *aliasData = [self aliasData];

	if (path || aliasData) {
		NSMutableDictionary *temp = [NSMutableDictionary dictionary];

		if (path) {
			[temp setObject:path
			         forKey:_CFURLStringKey];
			[temp setObject:[NSNumber numberWithInt:kCFURLPOSIXPathStyle]
			         forKey:_CFURLStringTypeKey];
		}

		if (aliasData) {
			[temp setObject:aliasData
			         forKey:_CFURLAliasDataKey];
		}

		dict = temp;
	}

	return dict;
}

@end

#pragma mark -
#pragma mark AppKit

@implementation NSWorkspace (GrowlAdditions)

- (NSImage *) iconForApplication:(NSString *) inName {
	NSString *path = [self fullPathForApplication:inName];
	NSImage *appIcon = path ? [self iconForFile:path] : nil;
	
	if ( appIcon ) {
		[appIcon setSize:NSMakeSize(128.0f,128.0f)];
	}
	return appIcon;
}

@end

#pragma mark -

// Thanks to Alcor for the following. This allows us to tell the window manager
// that the window should be sticky. A sticky window will stay around when the
// Exposé sweep-all-windows-away event happens. Additionally, if a window is not
// sticky while it fades in (see KABubbleWindowController for an example of fading
// in), and simultaneously the desktop is switched via DesktopManager, the window
// may end up getting left on the previous desktop, even if that window's level 
// set to NSStatusWindowLevel. See http://www.cocoadev.com/index.pl?DontExposeMe 
// for more information.
typedef int CGSConnection;
typedef int CGSWindow;
extern CGSConnection _CGSDefaultConnection(void);

OSStatus CGSGetWindowTags(CGSConnection cid,CGSWindow window,int *tags,int other);
OSStatus CGSSetWindowTags(CGSConnection cid,CGSWindow window,int *tags,int other);

@implementation NSWindow (GrowlAdditions)

-(void) setSticky:(BOOL)flag {
	CGSConnection cid;
	CGSWindow wid;
		
	wid = [self windowNumber];
	cid = _CGSDefaultConnection();
	int tags[2];
	tags[0] = tags[1] = 0;
	OSStatus retVal = CGSGetWindowTags(cid, wid, tags, 32);
		
	if (!retVal) {
		if (flag) {
			tags[0] = tags[0] | 0x00000800;
		} else {
			tags[0] = tags[0] & 0x00000800;
		}
		retVal = CGSSetWindowTags(cid, wid, tags, 32);
	}
}

@end
