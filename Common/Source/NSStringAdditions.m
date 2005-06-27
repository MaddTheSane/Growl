//
//  NSStringAdditions.m
//  Growl
//
//  Created by Ingmar Stein on 16.05.05.
//  Copyright 2005 The Growl Project. All rights reserved.
//
// This file is under the BSD License, refer to License.txt for details

#import "NSStringAdditions.h"
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

@implementation NSString (GrowlAdditions)

+ (NSString *) stringWithUTF8String:(const char *)bytes length:(unsigned)len {
	return [[[NSString alloc] initWithUTF8String:bytes length:len] autorelease];
}

- (id) initWithUTF8String:(const char *)bytes length:(unsigned)len {
	return [self initWithBytes:bytes length:len encoding:NSUTF8StringEncoding];
}

//for greater polymorphism with NSNumber.
- (BOOL) boolValue {
	return [self intValue] != 0
	|| [self caseInsensitiveCompare:@"yes"]  == NSOrderedSame
	|| [self caseInsensitiveCompare:@"true"] == NSOrderedSame;
}

- (unsigned long) unsignedLongValue {
	return strtoul([self UTF8String], /*endptr*/ NULL, /*base*/ 0);
}

- (unsigned) unsignedIntValue {
	return [self unsignedLongValue];
}

- (BOOL) isSubpathOf:(NSString *)superpath {
	NSString *canonicalSuperpath = [superpath stringByStandardizingPath];
	NSString *canonicalSubpath = [self stringByStandardizingPath];
	return [canonicalSubpath isEqualToString:canonicalSuperpath]
		|| [canonicalSubpath hasPrefix:[canonicalSuperpath stringByAppendingString:@"/"]];
}

- (NSAttributedString *) hyperlinkWithColor:(NSColor *)color {
	NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:
		[NSNumber numberWithInt:NSSingleUnderlineStyle], NSUnderlineStyleAttributeName,
		self, NSLinkAttributeName,    // link to self
		[NSFont systemFontOfSize:[NSFont smallSystemFontSize]],	NSFontAttributeName,
		color, NSForegroundColorAttributeName,
		[NSCursor pointingHandCursor], NSCursorAttributeName,
        nil];
	NSAttributedString *result = [[[NSAttributedString alloc] initWithString:self attributes:attributes] autorelease];
	[attributes release];
	return result;
}

- (NSAttributedString *) hyperlink {
	return [self hyperlinkWithColor:[NSColor blueColor]];
}
- (NSAttributedString *) activeHyperlink {
	return [self hyperlinkWithColor:[NSColor redColor]];
}

+ (NSString *) stringWithAddressData:(NSData *)aAddressData {
	struct sockaddr *socketAddress = (struct sockaddr *)[aAddressData bytes];
	// IPv6 Addresses are "FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF"
	//      at max, which is 40 bytes (0-terminated)
	// IPv4 Addresses are "255.255.255.255" at max which is smaller
	char stringBuffer[40];
	NSString *addressAsString = nil;
	if (socketAddress->sa_family == AF_INET) {
		struct sockaddr_in *ipv4 = (struct sockaddr_in *)socketAddress;
		if (inet_ntop(AF_INET, &(ipv4->sin_addr), stringBuffer, 40))
			addressAsString = [NSString stringWithUTF8String:stringBuffer];
		else
			addressAsString = @"IPv4 un-ntopable";
		addressAsString = [addressAsString stringByAppendingFormat:@":%d", ipv4->sin_port];
	} else if (socketAddress->sa_family == AF_INET6) {
		struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)socketAddress;
		if (inet_ntop(AF_INET6, &(ipv6->sin6_addr), stringBuffer, 40))
			addressAsString = [NSString stringWithUTF8String:stringBuffer];
		else
			addressAsString = @"IPv6 un-ntopable";
		// Suggested IPv6 format (see http://www.faqs.org/rfcs/rfc2732.html)
		addressAsString = [NSString stringWithFormat:@"[%@]:%d", addressAsString, ipv6->sin6_port];
	} else {
		addressAsString = @"neither IPv6 nor IPv4";
	}

	return addressAsString;
}

+ (NSString *) hostNameForAddressData:(NSData *)aAddressData {
	char hostname[NI_MAXHOST];
	struct sockaddr *socketAddress = (struct sockaddr *)[aAddressData bytes];
	if (getnameinfo(socketAddress, [aAddressData length],
					hostname, sizeof(hostname),
					/*serv*/ NULL, /*servlen*/ 0,
					NI_NAMEREQD))
		return nil;
	else
		return [NSString stringWithCString:hostname encoding:NSASCIIStringEncoding];
}

+ (NSString *) stringWithString:(NSString *)str0 andCharacter:(unichar)ch andString:(NSString *)str1 {
	unsigned len0 = (str ? [str0 length] : 0U), len1 = (str1 ? [str1 length] : 0U);

	unichar *buf = malloc(sizeof(unichar) * (len0 + (ch != 0xffff) + len1));
	unsigned i = 0U;

	if(str0) {
		memcpy(&buf[i], [[str0 dataUsingEncoding:NSUnicodeStringEncoding] bytes], len0);
		i += len0;
	}
	if(ch != 0xffff) {
		buf[i++] = ch;
	}
	if(str1) {
		memcpy(&buf[i], [[str1 dataUsingEncoding:NSUnicodeStringEncoding] bytes], len1);
		i += len1;
	}

	return [(NSString *)CFStringCreateWithCharactersNoCopy(kCFAllocatorDefault, buf, /*length*/ i, kCFAllocatorMalloc) autorelease];
}
- (NSString *) initWithString:(NSString *)str0 andCharacter:(unichar)ch andString:(NSString *)str1 {
	[self release];

	unsigned len0 = (str ? [str0 length] : 0U), len1 = (str1 ? [str1 length] : 0U);

	unichar *buf = malloc(sizeof(unichar) * (len0 + (ch != 0xffff) + len1));
	unsigned i = 0U;

	if(str0) {
		memcpy(&buf[i], [[str0 dataUsingEncoding:NSUnicodeStringEncoding] bytes], len0);
		i += len0;
	}
	if(ch != 0xffff) {
		buf[i++] = ch;
	}
	if(str1) {
		memcpy(&buf[i], [[str1 dataUsingEncoding:NSUnicodeStringEncoding] bytes], len1);
		i += len1;
	}

	return (NSString *)CFStringCreateWithCharactersNoCopy(kCFAllocatorDefault, buf, /*length*/ i, /*contentsDeallocator*/ kCFAllocatorMalloc);
}

@end
