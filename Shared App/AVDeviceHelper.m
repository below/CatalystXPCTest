//
//  AVDeviceHelper.m
//  CatalystXPCTest
//
//  Created by Alexander v. Below on 30.11.21.
//

#import "AVDeviceHelper.h"
#import "AVFoundation/AVFoundation.h"

@implementation AVDeviceHelper
+ (NSArray <NSString *> *)avDeviceNames {
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
    return deviceNames;
}
@end
