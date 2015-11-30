//
//  VivochaMessage.h
//  ios-sdk
//
//  Created by Michael Siddi on 10/22/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VivochaObject.h"
#import "VivochaAttachment.h"

@interface VivochaMessage : VivochaObject

/**
 *  If the message is sent from the current device, it returns YES. Otherwise it returns NO (e.g. a message from the agent).
 */
@property (nonatomic, assign) BOOL isOutgoing;


/**
 *  The remote peer address. (e.g. agentID@chat.vivocha.com in case of XMPP protocol)
 */
@property (nonatomic, retain) NSString *remotePeer;

/**
 *  The text of the message.
 */
@property (nonatomic, retain) NSString *messageText;

/**
 *  Factory method to instantiate a VivochaMessage object.
 *
 *  @param text       the message text
 *  @param isOutgoing YES if it is an outgoing message, NO if it is incoming.
 *
 *  @return the VivochaMessage object.
 */
+ (VivochaMessage *) messageWithText:(NSString *)text andIsOutgoing:(BOOL)isOutgoing;

@end
