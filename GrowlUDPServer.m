//
//  GrowlUDPServer.m
//  Growl
//
//  Created by Ingmar Stein on 18.11.04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "GrowlUDPServer.h"
#import "GrowlController.h"
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

@implementation GrowlUDPServer
- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:NSFileHandleReadToEndOfFileCompletionNotification
												  object:nil];
	[fh release];
	[sock release];
}

- (void)fileHandleRead:(NSNotification *)aNotification
{
	char *notificationName;
	char *title;
	char *description;
	char *applicationName;
	unsigned notificationNameLen, titleLen, descriptionLen, priority, applicationNameLen;
	BOOL isSticky;

	NSDictionary *userInfo = [aNotification userInfo];
	NSNumber *error = (NSNumber *)[userInfo objectForKey:@"NSFileHandleError"];
	if( ![error intValue] ) {
		NSData *data = (NSData *)[userInfo objectForKey:@"NSFileHandleNotificationDataItem"];
		if( [data length] >= sizeof(struct GrowlNetworkNotification) ) {
			struct GrowlNetworkNotification *nn = (struct GrowlNetworkNotification *)[data bytes];
			priority = nn->flags.priority;
			isSticky = nn->flags.sticky;
			notificationName = nn->data;
			notificationNameLen = ntohl( nn->nameLen );
			title = notificationName + notificationNameLen;
			titleLen = ntohl( nn->titleLen );
			description = title + titleLen;
			descriptionLen = ntohl( nn->descriptionLen );
			applicationName = description + descriptionLen;
			applicationNameLen = ntohl( nn->appNameLen );

			if( [data length] >= sizeof(struct GrowlNetworkNotification) + notificationNameLen
				+ titleLen + descriptionLen + applicationNameLen ) {
				NSDictionary *notificationInfo;
				notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:
					[NSString stringWithUTF8String:notificationName length:notificationNameLen], GROWL_NOTIFICATION_NAME,
					[NSString stringWithUTF8String:applicationName length:applicationNameLen], GROWL_APP_NAME,
					[NSString stringWithUTF8String:title length:titleLen], GROWL_NOTIFICATION_TITLE,
					[NSString stringWithUTF8String:description length:descriptionLen], GROWL_NOTIFICATION_DESCRIPTION,
					[NSNumber numberWithInt:priority], GROWL_NOTIFICATION_PRIORITY,
					[NSNumber numberWithBool:isSticky], GROWL_NOTIFICATION_STICKY,
					nil];
				[[GrowlController singleton] dispatchNotificationWithDictionary:notificationInfo];
			} else {
				NSLog( @"GrowlUDPServer: received runt packet." );
			}
		} else {
			NSLog( @"GrowlUDPServer: received runt packet." );
		}
	} else {
		NSLog( @"GrowlUDPServer: error %@.", error );
	}

	[fh readInBackgroundAndNotify];
}

- (id)init
{
	struct sockaddr_in addr;
	NSData *addrData;

	if( (self = [super init]) ) {
		addr.sin_addr.s_addr = INADDR_ANY;
		addr.sin_port = htons( GROWL_UDP_PORT );
		addr.sin_family = AF_INET;
		addrData = [NSData dataWithBytes:&addr length:sizeof(addr)];
		sock = [[NSSocketPort alloc] initWithProtocolFamily:AF_INET
												 socketType:SOCK_DGRAM
												   protocol:IPPROTO_UDP
													address:addrData];

		fh = [[NSFileHandle alloc] initWithFileDescriptor:[sock socket] closeOnDealloc:YES];
		[fh readInBackgroundAndNotify];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(fileHandleRead:)
													 name:NSFileHandleReadCompletionNotification
												   object:fh];
	}

	return( self );
}
@end
