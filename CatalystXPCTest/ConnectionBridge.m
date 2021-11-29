//
//  ConnectionBridge.m
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 27.11.21.
//

#import "ConnectionBridge.h"
#import "XPCServiceTestProtocol.h"

@implementation ConnectionBridge
- (void) simpleTest {
    NSXPCInterface *myCookieInterface =
        [NSXPCInterface interfaceWithProtocol:
            @protocol(XPCServiceTestProtocol)];

    NSXPCConnection *myConnection =    [[NSXPCConnection alloc]
                                         initWithServiceName:@"com.vonbelow.xpcTest"];
                                    myConnection.remoteObjectInterface = myCookieInterface;
                                    [myConnection resume];
}

@end