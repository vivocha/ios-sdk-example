//
//  VivochaTheme.h
//  ios-sdk
//
//  Created by Michael Siddi on 18/11/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VivochaValues.h"

@interface VivochaTheme : NSObject

@property (nonatomic, retain) UIColor *sideButtonBackgroundColor; //side button 'CHAT NOW' background color
@property (nonatomic, retain) UIColor *sideButtonTextColor; //side button 'CHAT NOW' text color
//@property (nonatomic, retain) NSString *sideButtonText; //side button. changes the CHAT NOW text

@property (nonatomic) VivochaPositionSide sideButtonSide;
@property (nonatomic) VivochaPosition sideButtonPosition;


@property (nonatomic, retain) UIColor *chatBackgroundColor; //chat view background color
@property (nonatomic, retain) UIImage *chatBackgroundImage; //chat view background image. 

@property (nonatomic, assign) CGFloat chatBubbleCornerRadius; //chat bubble corner radius

@property (nonatomic, retain) UIColor *chatBubbleOutgoingColor; //chat bubble background color for outgoing messages
@property (nonatomic, retain) UIColor *chatBubbleIncomingColor; //chat bubble background color for incoming messages

@property (nonatomic, retain) UIColor *chatBubbleOutgoingTextColor; //chat bubble text color for outgoing messages
@property (nonatomic, retain) UIColor *chatBubbleIncomingTextColor; //chat bubble text color for incoming messages

@property (nonatomic, retain) UIColor *chatStatusTextColor; //text color for status messages. (e.g. 'The agent joined the chat')

@property (nonatomic, retain) UIColor *chatSendButtonBackgroundColor; //chat view send button background color
@property (nonatomic, retain) UIColor *chatSendButtonTextColor; //chat view send button text color

@property (nonatomic, retain) UIColor *chatInputViewBackgroundColor;
@property (nonatomic, retain) UIColor *chatInputViewTextColor;

@property (nonatomic, retain) UIColor *chatTopViewBackgroundColor;
@property (nonatomic, retain) UIColor *chatTopViewButtonTextColor;


@end
