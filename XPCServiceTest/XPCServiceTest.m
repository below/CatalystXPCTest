//
//  XPCServiceTest.m
//  XPCServiceTest
//
//  Created by Alexander v. Below on 27.11.21.
//

#import "XPCServiceTest.h"

@implementation XPCServiceTest

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
