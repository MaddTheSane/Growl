//
//  TestVersionParsing.m
//  Growl
//
//  Created by Peter Hosey on 2009-10-13.
//  Copyright 2009 Peter Hosey. All rights reserved.
//

#import "TestVersionParsing.h"

#import "GrowlVersionUtilities.h"

@implementation TestVersionParsing

#pragma mark Things that should work

- (void) testParseTwoComponentSVNVersion {
	struct Version version;
	NSString *string = @"1.3svn1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}
- (void) testParseTwoComponentHgVersion {
	struct Version version;
	NSString *string = @"1.3hg1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (Hg revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}
- (void) testParseTwoComponentDevelopmentVersion {
	struct Version version;
	NSString *string = @"1.3d1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_development,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_development);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseTwoComponentAlphaVersion {
	struct Version version;
	NSString *string = @"1.3a1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_alpha,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_alpha);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseTwoComponentBetaVersion {
	struct Version version;
	NSString *string = @"1.3b1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_beta,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_beta);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseTwoComponentReleaseVersion {
	struct Version version;
	NSString *string = @"1.3";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_release,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_alpha);
	XCTAssertEqual(
		version.development, (u_int32_t)0,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)0);
}

- (void) testParseThreeComponentSVNVersion {
	struct Version version;
	NSString *string = @"1.3.4svn1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}
- (void) testParseThreeComponentHgVersion {
	struct Version version;
	NSString *string = @"1.3.4hg1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (Hg revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}
- (void) testParseThreeComponentDevelopmentVersion {
	struct Version version;
	NSString *string = @"1.3.4d1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_development,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_development);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseThreeComponentAlphaVersion {
	struct Version version;
	NSString *string = @"1.3.4a1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_alpha,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_alpha);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseThreeComponentBetaVersion {
	struct Version version;
	NSString *string = @"1.3.4b1";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_beta,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_beta);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseThreeComponentReleaseVersion {
	struct Version version;
	NSString *string = @"1.3.4";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)4,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)4);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_release,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_alpha);
	XCTAssertEqual(
		version.development, (u_int32_t)0,
		@"Development component was %u, not %u",
		version.development, (u_int32_t)0);
}

#pragma mark Things that should not work

- (void) testParseNil {
	struct Version version;
	NSString *string = nil;
	XCTAssertFalse(parseVersionString(string, &version), @"Successfully parsed nil");
}
- (void) testParseWord {
	struct Version version;
	NSString *string = @"atychiphobia";
	XCTAssertFalse(parseVersionString(string, &version), @"Successfully parsed a word (%@); output version was %@", string, [NSMakeCollectable(createVersionDescription(version)) autorelease]);
}
- (void) testParseWordFollowedByReleaseVersion {
	struct Version version;
	NSString *string = @"Final 1.3";
	XCTAssertFalse(parseVersionString(string, &version), @"Successfully parsed a word followed by a version (%@) - this should have failed. Output version was %@", string, [NSMakeCollectable(createVersionDescription(version)) autorelease]);
}
- (void) testParseReleaseVersionFollowedByWord {
	struct Version version;
	NSString *string = @"1.3 final";
	XCTAssertFalse(parseVersionString(string, &version), @"Successfully parsed a version followed by a word (%@) - this should have failed. Output version was %@", string, [NSMakeCollectable(createVersionDescription(version)) autorelease]);
}

- (void) testParseVersionStringPrefixedBySpaces {
	struct Version version;
	NSString *string = @"  1.3.2b5";
	XCTAssertTrue(parseVersionString(string, &version), @"Could not parse a version string preceded by spaces");
}
- (void) testParseVersionStringPrefixedByLineFeed {
	struct Version version;
	NSString *string = @"\n1.3.2b5";
	XCTAssertTrue(parseVersionString(string, &version), @"Could not parse a version string preceded by a line feed");
}
- (void) testParseVersionStringSuffixedBySpaces {
	struct Version version;
	NSString *string = @"1.3.2b5  ";
	XCTAssertTrue(parseVersionString(string, &version), @"Could not parse a version string followed by spaces");
}
- (void) testParseVersionStringSuffixedByLineFeed {
	struct Version version;
	NSString *string = @"1.3.2b5\n";
	XCTAssertTrue(parseVersionString(string, &version), @"Could not parse a version string followed by a line feed");
}

- (void) testParseTwoComponentSVNVersionWithSpacesAroundReleaseType {
	struct Version version;
	NSString *string = @"1.3 svn 1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}
- (void) testParseTwoComponentSVNVersionWithSmallLetterRBeforeRevisionNumber{
	struct Version version;
	NSString *string = @"1.3svnr1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
				   version.major, (u_int16_t)1,
				   @"Major component was %u, not %u",
				   version.major, (u_int16_t)1);
	XCTAssertEqual(
				   version.minor, (u_int16_t)3,
				   @"Minor component was %u, not %u",
				   version.minor, (u_int16_t)3);
	XCTAssertEqual(
				   version.incremental, (u_int8_t)0,
				   @"Incremental component was %u, not %u",
				   version.incremental, (u_int8_t)0);
	XCTAssertEqual(
				   version.releaseType, (u_int8_t)releaseType_vcs,
				   @"Release-type component was %u, not %u",
				   version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
				   version.development, (u_int32_t)1400,
				   @"Development component (SVN revision) was %u, not %u",
				   version.development, (u_int32_t)1400);
}
- (void) testParseTwoComponentSVNVersionWithSpacesAroundReleaseTypeAndSmallLetterRBeforeRevisionNumber {
	struct Version version;
	NSString *string = @"1.3 svn r1400";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)1400,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1400);
}

- (void) testParseSVNVersionWithNoRevisionNumber {
	struct Version version;
	NSString *string = @"1.3svn";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_vcs,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_vcs);
	XCTAssertEqual(
		version.development, (u_int32_t)0,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)0);
}
- (void) testParseDevelopmentVersionWithNoDevelopmentVersionNumber {
	struct Version version;
	NSString *string = @"1.3d";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_development,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_development);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseAlphaVersionWithNoDevelopmentVersionNumber {
	struct Version version;
	NSString *string = @"1.3a";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_alpha,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_alpha);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1);
}
- (void) testParseBetaVersionWithNoDevelopmentVersionNumber {
	struct Version version;
	NSString *string = @"1.3b";
	XCTAssertTrue(parseVersionString(string, &version), @"Parse of %@ failed", string);
	XCTAssertEqual(
		version.major, (u_int16_t)1,
		@"Major component was %u, not %u",
		version.major, (u_int16_t)1);
	XCTAssertEqual(
		version.minor, (u_int16_t)3,
		@"Minor component was %u, not %u",
		version.minor, (u_int16_t)3);
	XCTAssertEqual(
		version.incremental, (u_int8_t)0,
		@"Incremental component was %u, not %u",
		version.incremental, (u_int8_t)0);
	XCTAssertEqual(
		version.releaseType, (u_int8_t)releaseType_beta,
		@"Release-type component was %u, not %u",
		version.releaseType, (u_int8_t)releaseType_beta);
	XCTAssertEqual(
		version.development, (u_int32_t)1,
		@"Development component (SVN revision) was %u, not %u",
		version.development, (u_int32_t)1);
}

@end
