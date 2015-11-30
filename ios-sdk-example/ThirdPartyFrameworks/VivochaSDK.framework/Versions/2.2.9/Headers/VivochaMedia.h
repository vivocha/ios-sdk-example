//
//  VivochaMedia.h
//  ios-sdk
//
//  Created by Michael Siddi on 09/06/15.
//  Copyright (c) 2015 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VivochaMedia : NSObject

@property (nonatomic, readonly) BOOL isLocalAudioEnabled;
@property (nonatomic, readonly) BOOL isLocalVideoEnabled;
@property (nonatomic, readonly) BOOL isRemoteAudioEnabled;
@property (nonatomic, readonly) BOOL isRemoteVideoEnabled;

- (BOOL) isAllOff;
- (void) setLocalAudio:(BOOL)lAudio localVideo:(BOOL)lVideo remoteAudio:(BOOL)rAudio remoteVideo:(BOOL)rVideo;
@end
