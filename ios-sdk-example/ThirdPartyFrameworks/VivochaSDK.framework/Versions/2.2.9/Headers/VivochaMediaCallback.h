//
//  VivochaMediaCallback.h
//  ios-sdk
//
//  Created by Michael Siddi on 11/06/15.
//  Copyright (c) 2015 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VivochaMedia.h"
#import "VivochaCapabilities.h"

@interface VivochaMediaCallback : NSObject

typedef void (^VivochaMediaEventBlock)(VivochaMedia * media);
typedef void (^VivochaCapabilitiesEventBlock)(VivochaCapabilities *caps);
typedef void (^VivochaMediaWaitingBlock)();
typedef void (^VivochaMediaErrorBlock)(NSString *error);
typedef void (^VivochaMediaRejectedBlock)();

@property (nonatomic, copy) VivochaMediaEventBlock mediaEventBlock;
@property (nonatomic, copy) VivochaCapabilitiesEventBlock capabilitiesBlock;
@property (nonatomic, copy) VivochaMediaWaitingBlock waitingBlock;
@property (nonatomic, copy) VivochaMediaErrorBlock errorBlock;
@property (nonatomic, copy) VivochaMediaRejectedBlock rejectedBlock;

- (instancetype)initWithOnMedia:(VivochaMediaEventBlock)mediaEvent onCaps:(VivochaCapabilitiesEventBlock)capsBlock onWaiting:(VivochaMediaWaitingBlock)waitingBlock onError:(VivochaMediaErrorBlock)errorBlock onReject:(VivochaMediaRejectedBlock)rejectBlock;

- (void) onMediaEvent:(VivochaMedia *)media;
- (void) onCapabilities:(VivochaCapabilities *)caps;
- (void) onWaiting;
- (void) onError:(NSString *)error;
- (void) onReject;

@end



