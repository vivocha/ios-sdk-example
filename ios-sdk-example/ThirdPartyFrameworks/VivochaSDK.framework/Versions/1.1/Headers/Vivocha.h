//
//  Vivocha.h
//  ios-sdk
//
//  Created by Michael Siddi on 10/17/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VivochaTheme.h"
#import "VivochaValues.h"

#import "VivochaCustomAction.h"

@class VivochaContact;
@class VivochaTheme;
@class VivochaDataCollection;
@class VivochaPage;

@interface Vivocha : NSObject

/**
 *  Returns the Vivocha manager that retains all the objects that Vivocha needs to work correctly.
 *
 *  @return the Vivocha singleton.
 */
+ (Vivocha *) manager;

/**
 *  Starts Vivocha using the accountID and ServiceID.
 *
 *  @param accountID Your Vivocha accountID (e.g. vivocha.com/a/YOUR_ACCOUNT_ID/login)
 *  @param servID    The serviceID for this application. You will find the ID in the iOS foundry inside the Agent Desktop's settings.
 *
 *  @return YES if Vivocha started correctly, NO otherwise.
 */
+ (BOOL) startWithAccountID:(NSString *)accountID andServID:(NSString *)servID;

/**
 *  Starts Vivocha using the accountID and ServiceID.
 *
 *  @param automatic If YES Vivocha will automatically add itself as a listener for 
 *              application:didReceiveRemoteNotification:fetchCompletionHandler:
 *              application:didRegisterForRemoteNotificationsWithDeviceToken:
 *              application:didFailToRegisterForRemoteNotificationsWithError:
 *                  otherwise you will need to add some other Vivocha method calls inside your application delegate's methods.
 *  @see setPushTokenWithData:
 *  @param accountID Your Vivocha accountID (e.g. vivocha.com/a/YOUR_ACCOUNT_ID/login)
 *  @param servID    The serviceID for this application. You will find the ID in the iOS foundry inside the Agent Desktop's settings.
 *
 *  @return YES if Vivocha started correctly, NO otherwise.
 */
+ (BOOL) startAutomatic:(BOOL)automatic withAccountID:(NSString *)accountID andServID:(NSString *)servID;

/**
 *  Stops Vivocha
 *
 *  @return YES if Vivocha stops correctly, NO otherwise
 */
+ (BOOL) stop;

/**
 *  Set the data collection that will be sent when a new contact is requested.
 *
 *  @param dataCollection a VivochaDataCollection object.
 */
+ (void) setDataCollection:(VivochaDataCollection *)dataCollection;

/**
 *  Returns the data collection that was previously set.
 *
 *  @return a VivochaDataCollection object..
 */
+ (VivochaDataCollection *) getDataCollection;

/**
 *  Set the contact color that the agent will see when a new contact has been started from the current application.
 *
 *  @param color A VivochaContactColor value (e.g. VivochaContactColorOrange);
 *  @see VivochaContactColor
 */
+ (void) setContactColor:(VivochaContactColor)color;

/**
 *  Set the local theme for the chat and side button
 *
 *  @param theme your local theme
 */

+ (void) setTheme:(VivochaTheme *)theme;


/**
 *  Enables/Disables the developer mode.
 *
 *  @param enable YES if you want to enable the dev mode, NO otherwise.
 */
+ (void) setDeveloperMode:(BOOL) enable;

/**
 *  Returns YES if the developer mode is enabled.
 */
- (BOOL) getDeveloperMode;

+ (BOOL) isShowingSideTab;

/**
 *  Returns your local theme that was set by the setTheme: method.
 *
 *  @return The local theme.
 */
+ (VivochaTheme *) getTheme;

/**
 *  Shows the side tab button.
 */
+ (void) showChatButton;

/**
 *  Hides the side tab button.
 */
+ (void) hideChatButton;

/**
 *  If a contact is in progress it notifies the agent that the user moves to a different view controller.
 *
 *  @param page The current page.
 */
+ (void) notifyNewPage:(VivochaPage *)page;

/**
 *  If a contact is in progress, it returns the contact object, otherwise returns nil.
 *
 *  @return the current contact.
 */
+ (VivochaContact *) contact;

/**
 *  Creates a new contact.
 *
 *  @param dataCollection  the data collection.
 *  @param completionBlock when the request is completed, the completion block will be execute.
 */
+ (void) createChatWithDataCollection:(VivochaDataCollection *)dataCollection andCompletionBlock:(void(^)(VivochaContact * contact))completionBlock;

/**
 *  Enable Vivocha to send push notifications to the current device. If you started Vivocha with 'automatic' set to NO, you need to call this method in your Application Delegate application:didRegisterForRemoteNotificationsWithDeviceToken: method
 *  @see application:didRegisterForRemoteNotificationsWithDeviceToken:
 *  @param tokenData the token data received from the application:didRegisterForRemoteNotificationsWithDeviceToken: method.
 */
+ (void) setPushTokenWithData:(NSData *)tokenData;

/**
 *  Blocks the appereance of the side tab button.
 *
 *  @param block YES if you want to prevent the appearance of the side button.
 */
+ (void) setBlockSideButton:(BOOL)block;

/**
 *  Binds an action name with an action block. When a custom action arrives from the agent desktop, the block will be executed.
 *
 *  @param actionName the action name.
 *  @param block      the action block.
 */
- (void) bindAction:(NSString *)actionName withBlock:(void (^)(VivochaCustomAction *action))block;


@end
