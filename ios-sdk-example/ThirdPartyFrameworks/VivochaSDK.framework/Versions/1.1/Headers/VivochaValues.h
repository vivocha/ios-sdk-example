//
//  VivochaValues.h
//  ios-sdk
//
//  Created by Michael Siddi on 11/11/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//


#ifndef VivochaSDK_Constants_h
#define VivochaSDK_Constants_h
    #define VIVOCHA_SDK_BASE_URL @"https://www.vivocha.com"
#endif


#ifndef VivochaSDK_Values_h
#define VivochaSDK_Values_h

#ifndef UIColorFromRGB
    #define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#endif


static inline void dispatch_async_on_main_thread(dispatch_block_t block) {
    if (block) {
        if ([NSThread isMainThread]) block();
        else dispatch_async(dispatch_get_main_queue(), block);
    }
}


static NSString *VivochaSDK_Notif_Start                                             = @"VivochaSDK_Notif_Start";
static NSString *VivochaSDK_Notif_Stop                                              = @"VivochaSDK_Notif_Stop";

static NSString *VivochaSDK_Notif_AvailableAgents                                   = @"VivochaSDK_Notif_AvailableAgents"; //Did receive getMedia response
static NSString *VivochaSDK_Notif_UnavailableAgents                                 = @"VivochaSDK_Notif_UnavailableAgents"; //Did receive getMedia response

static NSString *VivochaSDK_Notif_CreateContactResult                               = @"VivochaSDK_Notif_CreateContactResult";

static NSString *VivochaSDK_Notif_Contact_SentTextMessageResult                     = @"VivochaSDK_Notif_Contact_SentTextMessageResult";
static NSString *VivochaSDK_Notif_Contact_DidSendCustomActionResult                 = @"VivochaSDK_Notif_Contact_DidSendCustomActionResult";
static NSString *VivochaSDK_Notif_Contact_ReceivedTextMessage                       = @"VivochaSDK_Notif_Contact_ReceivedTextMessage";

static NSString *VivochaSDK_Notif_Contact_ReceivedTerminationEventFromOtherPeer     = @"VivochaSDK_Notif_Contact_ReceivedTerminationEventFromOtherPeer";
static NSString *VivochaSDK_Notif_Contact_Terminated                                = @"VivochaSDK_Notif_Contact_Terminated";


typedef NS_ENUM(NSInteger, VivochaContactColor)  {
    VivochaContactColorWhite = 0,
    VivochaContactColorYellow = 1,
    VivochaContactColorOrange = 2,
    VivochaContactColorGreen = 3,
    VivochaContactColorBlue = 4,
    VivochaContactColorPurple = 5,
    VivochaContactColorRed = 6,
    VivochaContactColorDefault = VivochaContactColorRed
};

typedef NS_ENUM(NSInteger, VivochaPosition) {
    VivochaPositionTop = 1,
    VivochaPositionMiddle = 2,
    VivochaPositionBottom = 3,
};

typedef NS_ENUM(NSInteger, VivochaPositionSide)  {
    VivochaPositionSideUp = 1,
    VivochaPositionSideDown = 2,
    VivochaPositionSideLeft = 3,
    VivochaPositionSideRight = 4
};

typedef NS_ENUM(NSInteger, VivochaConnectionState){
    VivochaConnectionStateDidFailAuthentication = 1,
    VivochaConnectionStateConnecting = 2,
    VivochaConnectionStateConnected = 3,
    VivochaConnectionStateDisconnecting = 4,
    VivochaConnectionStateDisconnectedWithTimeout = 5,
    VivochaConnectionStateDisconnectedWithError = 6,
    VivochaConnectionStateDisconnected = 7,
    VivochaConnectionStateTransferring = 8,
};

typedef NS_ENUM(NSInteger, VivochaChatPresenceType){
    VivochaChatPresenceTypeOnline = 1,
    VivochaChatPresenceTypeGone = 2,
    VivochaChatPresenceTypeTransfer = 3,
};



#endif
