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

static inline NSString *vvcNSStringFromUIInterfaceOrientation(UIInterfaceOrientation orientation) {
    switch (orientation) {
        case UIInterfaceOrientationPortrait:           return @"UIInterfaceOrientationPortrait";
        case UIInterfaceOrientationPortraitUpsideDown: return @"UIInterfaceOrientationPortraitUpsideDown";
        case UIInterfaceOrientationLandscapeLeft:      return @"UIInterfaceOrientationLandscapeLeft";
        case UIInterfaceOrientationLandscapeRight:     return @"UIInterfaceOrientationLandscapeRight";
        default: return @"Unknown";
    }
}


//Notifications

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


//Translation keys

// -- Misc --

static NSString *VivochaSDK_String_Agent = @"agent"; //Agent
static NSString *VivochaSDK_String_Agent_Typing = @"agent_typing"; // is typing...
static NSString *VivochaSDK_String_Agent_Available_Format = @"agent_available_format"; // Agent %@ has joined the chat.
static NSString *VivochaSDK_String_Agent_Unavailable_Format = @"agent_unvailable_format"; // Agent %@ has left the chat
static NSString *VivochaSDK_String_Agent_Waiting = @"agent_waiting_message"; // Waiting for an agent
static NSString *VivochaSDK_String_Agent_Waiting_Transfer = @"agent_waiting_transfer_message"; // Transfer in progress

static NSString *VivochaSDK_String_Agent_Online = @"agent_online"; //is online
static NSString *VivochaSDK_String_Agent_Offline = @"agent_offline"; //is offline


static NSString *VivochaSDK_String_UI_SideTab = @"sidetab_text";

// -- Chat View  --

static NSString *VivochaSDK_String_UI_Btn_Minimize = @"button_minimize"; // Minimize
static NSString *VivochaSDK_String_UI_Btn_Back = @"button_back"; // Minimize
static NSString *VivochaSDK_String_UI_Btn_Close = @"button_close"; // Close
static NSString *VivochaSDK_String_UI_Btn_Send = @"button_send"; // Send

static NSString *VivochaSDK_String_UI_Alert_Btn_OK = @"button_ok"; // OK
static NSString *VivochaSDK_String_UI_Alert_Btn_NO = @"button_no"; // No
static NSString *VivochaSDK_String_UI_Alert_Btn_Cancel = @"button_cancel"; //Cancel

// -- Location  --

static NSString *VivochaSDK_String_UI_Alert_Location_Settings_Title = @"alert_location_settings_title"; //Location Service Disabled
static NSString *VivochaSDK_String_UI_Alert_Location_Settings_Message = @"alert_location_settings_message"; // To enable, please go to Settings -> Privacy -> Location and turn on Location Services for this app.

static NSString *VivochaSDK_String_UI_Alert_Location_Auth_Title = @"alert_location_request_title"; // Location Request
static NSString *VivochaSDK_String_UI_Alert_Location_Auth_Message = @"alert_location_request_message"; // Do you want to allow the agent to see your location?

// -- Screenshot  --

static NSString *VivochaSDK_String_UI_Alert_Screenshot_Auth_Title = @"alert_screenshot_request_title"; // Screenshot Request
static NSString *VivochaSDK_String_UI_Alert_Screenshot_Auth_Message = @"alert_screenshot_request_message"; // Do you want to allow the agent to see your screen?

// -- Contact Lifecycle --

static NSString *VivochaSDK_String_UI_Alert_Chat_Cleared_Message = @"alert_chat_cleared_message"; // The chat has been closed. Thank you.

static NSString *VivochaSDK_String_UI_Alert_Chat_Unavailable_Message = @"alert_chat_unavailable_message"; // The chat is not currently available.
static NSString *VivochaSDK_String_UI_Alert_Chat_Unavailable_Btn_OK = @"alert_chat_unavailable_button_ok"; // Retry
static NSString *VivochaSDK_String_UI_Alert_Chat_Unavailable_Btn_Cancel = @"alert_chat_unavailable_button_cancel"; // End

static NSString *VivochaSDK_String_UI_Alert_Contact_Creation_Failure_Message = @"alert_contact_creation_failure_message"; // There was an error establishing the contact. Please try again later.


//Contact Color
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

//Side Tab Position
typedef NS_ENUM(NSInteger, VivochaPosition) {
    VivochaPositionTop = 1,
    VivochaPositionMiddle = 2,
    VivochaPositionBottom = 3,
};

//Side Tab Side
typedef NS_ENUM(NSInteger, VivochaPositionSide)  {
    VivochaPositionSideUp = 1,
    VivochaPositionSideDown = 2,
    VivochaPositionSideLeft = 3,
    VivochaPositionSideRight = 4
};

//Vivocha Connection State
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

//Vivocha Presence Type
typedef NS_ENUM(NSInteger, VivochaChatPresenceType){
    VivochaChatPresenceTypeOnline = 1,
    VivochaChatPresenceTypeGone = 2,
};

//Vivocha Contact Media Type
typedef NS_ENUM(NSInteger, VivochaContactMediaType) {
    VivochaContactMediaTypeChat     = 1 << 0,
    VivochaContactMediaTypeVideo    = 1 << 1,
    VivochaContactMediaTypeAudio    = 1 << 2,
};



#endif
