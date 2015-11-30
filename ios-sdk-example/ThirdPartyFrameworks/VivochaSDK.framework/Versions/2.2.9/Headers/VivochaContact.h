//
//  VivochaContact.h
//  ios-sdk
//
//  Created by Michael Siddi on 29/10/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VivochaMessage.h"
#import "VivochaValues.h"
#import "VivochaCustomAction.h"
#import "VivochaMediaCallback.h"

@class VivochaProtocolRequest;
@class VivochaProtocolResponse;
@class VivochaAgent;
@class VivochaVideoView;

typedef void (^VivochaChatConnectionStateBlock) (VivochaConnectionState state);
typedef void (^VivochaAttachmentEventBlock)(VivochaAttachment *attachment);

@interface VivochaContact : NSObject

@property (atomic, assign) BOOL isShowingChat;
@property (nonatomic, retain) VivochaAgent *currentAgent;
@property (nonatomic, assign) BOOL isTerminated;
@property (nonatomic, assign) BOOL chatEndedByAgent;
@property (nonatomic, retain) NSDate *startDate;

/**
 *  Creates and connects the communication stream.
 */
- (void) connect;

/**
 *  Terminates a contact, hides the chat view and disconnects the communication stream.
 */
- (void) terminate;

/**
 *  Terminates a contact, disconnects the communication stream and if the passed parameter is YES, hides the chat view.
 *
 *  @param hide YES to hide the chat, NO to keep it open.
 */
- (void) terminateHidingView:(BOOL)hide;

/**
 *  Sends a background notification to the server in order to enable the push notifications.
 */
- (void) sendBackground;

/**
 *  Shows the chat view.
 *
 *  @param animated YES if you want an animation, NO otherwise.
 */
- (void) showView:(BOOL)animated;

/**
 *  Hides the chat view.
 *
 *  @param animated YES if you want an animation, NO otherwise
 */
- (void) hideView:(BOOL)animated;

/**
 *  Sends a VivochaMessage through the communication stream.
 *
 *  @param message the message.
 */

- (void) sendTextMessage:(VivochaMessage *) message;

/**
 *  Sends a 'composing'/'paused' message through the communication stream.
 *
 *  @param isTyping If YES the message will be 'composing', otherwise it will be 'paused'.
 */
- (void) sendChatState:(BOOL)isTyping;

/**
 *  Sends a custom action to the agent desktop through the communication stream.
 *
 *  @param action the custom action.
 */
- (void) sendCustomAction:(VivochaCustomAction *) action;

/**
 *  If an agent accepts the contact, this method will return an object containing the name and the avatar (if present) of the current agent.
 *
 *  @return the agent.
 */
- (VivochaAgent *) agent;

- (void) addChatConnectionStateBlock:(VivochaChatConnectionStateBlock)block withOwner:(id)owner;
- (void) unregisterFromConnectionStateBlock:(id)owner;

- (BOOL) isWaitingForTransfer;

- (void) startWebRTCWithRemoteView:(VivochaVideoView *)remoteView andLocalView:(VivochaVideoView *)localView andAudio:(BOOL)localAudio andFrontCamera:(BOOL)frontCamera andBackCamera:(BOOL)backCamera andRemoteAudio:(BOOL)rAudio andRemoteVideo:(BOOL)rVideo andCallback:(VivochaMediaCallback *)cb;

- (void) sendProtocolRequest:(VivochaProtocolRequest *)request withBlock:(void (^)(VivochaProtocolRequest *req, VivochaProtocolResponse *res))block;
- (void) sendProtocolRequest:(VivochaProtocolRequest *)request withBlock:(void (^)(VivochaProtocolRequest *req, VivochaProtocolResponse *res))block andQueue:(NSOperationQueue *)queue;

- (void) sendProtocolResponse:(VivochaProtocolResponse *)response;

- (void) hideView:(BOOL)animated andCompletionBlock:(void (^)())completion;


- (void) manageBackground;

- (NSInteger) getDuration;

@end
