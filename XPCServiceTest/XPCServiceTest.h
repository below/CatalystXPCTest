//
//  XPCServiceTest.h
//  XPCServiceTest
//
//  Created by Alexander v. Below on 27.11.21.
//

#import <Foundation/Foundation.h>
#import "XPCServiceTestProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface XPCServiceTest : NSObject <XPCServiceTestProtocol>
@end
