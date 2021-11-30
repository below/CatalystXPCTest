//
//  XPCServiceTest.m
//  XPCServiceTest
//
//  Created by Alexander v. Below on 27.11.21.
//

#import "XPCServiceTest.h"
#import "AVFoundation/AVFoundation.h"

@implementation XPCServiceTest

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

- (void) deviceNames:(void (^)(NSArray <NSString*> *))reply {
    NSMutableArray <NSString*> * deviceNames = [NSMutableArray new];

    NSArray *deviceTypes = @[
        AVCaptureDeviceTypeBuiltInWideAngleCamera,
        AVCaptureDeviceTypeExternalUnknown
    ];
    AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession
                                                            discoverySessionWithDeviceTypes:deviceTypes
                                                                                  mediaType:AVMediaTypeVideo
                                                                                   position:AVCaptureDevicePositionUnspecified];

    for (AVCaptureDevice *device in discoverySession.devices)
    {
        [deviceNames addObject: device.localizedName];
    }

    reply(deviceNames);
}
@end
