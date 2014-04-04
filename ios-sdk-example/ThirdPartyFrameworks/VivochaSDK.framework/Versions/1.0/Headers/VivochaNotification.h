//
//  VivochaNotification.h
//  ios-sdk
//
//  Created by Michael Siddi on 10/21/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VivochaValues.h"

@interface VivochaNotification : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSError *error;
@property (nonatomic, retain) id payload;


/**
 *  Factory method for a VivochaNotification
 *
 *  @param name    the notification name
 *  @param payload the notification payload
 *  @param error   the notification payload in case of error
 *
 *  @return the notification
 */
+ (VivochaNotification *) vivochaNotificationWithName:(NSString *)name andPayload:(id)payload andError:(NSError *)error;

/**
 *  Posts a VivochaNotification through the NSNotificationCenter's default center
 *
 *  @param in_name    the notification name
 *  @param in_payload the notification payload
 *  @param in_error   the notification payload in case of error
 */
+ (void) postVivochaNotificationWithName:(NSString *)in_name andPayload:(id)in_payload andError:(NSError *)in_error;

@end


@interface NSNotification (VivochaNotificationAddons)
/**
 *  Utility method to access directly to the VivochaNotification inside a NSNotification
 *
 *  @return the VivochaNotification object, if present.
 */
- (VivochaNotification *) vivochaNotification;
@end