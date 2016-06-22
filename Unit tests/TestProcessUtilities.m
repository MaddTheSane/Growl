//
//  TestProcessUtilities.m
//  Growl
//
//  Created by Peter Hosey on 2010-07-05.
//  Copyright 2010 The Growl Project. All rights reserved.
//

#import "TestProcessUtilities.h"

#import "GrowlProcessUtilities.h"

#define FINDER_BUNDLE_PATH @"/System/Library/CoreServices/Finder.app"
#define FINDER_BUNDLE_IDENTIFIER @"com.apple.finder"

//Both of these tests assume Finder is running. If you've quit Finder for any reason, they'll fail.

@implementation TestProcessUtilities

- (void) testFindingProcessByBundlePath {
	ProcessSerialNumber finderPSN = { 0, kNoProcess };
	bool found = Growl_GetPSNForProcessWithBundlePath(FINDER_BUNDLE_PATH, &finderPSN);
	XCTAssertTrue(found, @"Failed to find Finder by path");

	NSDictionary *dict = [NSMakeCollectable(ProcessInformationCopyDictionary(&finderPSN, kProcessDictionaryIncludeAllInformationMask)) autorelease];
	XCTAssertNotNil(dict, @"Found Finder by path, but got a bogus PSN: { %u, %u }", (unsigned int)finderPSN.highLongOfPSN, (unsigned int)finderPSN.lowLongOfPSN);
}
- (void) testFindingProcessByBundleID {
	bool found = Growl_ProcessExistsWithBundleIdentifier(FINDER_BUNDLE_IDENTIFIER);
	XCTAssertTrue(found, @"Failed to find Finder by bundle ID");
}

@end
