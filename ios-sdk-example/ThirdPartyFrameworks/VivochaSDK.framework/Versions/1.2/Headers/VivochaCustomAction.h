//
//  VivochaCustomAction.h
//  ios-sdk
//
//  Created by Michael Siddi on 20/01/14.
//  Copyright (c) 2014 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VivochaCustomAction : NSObject
@property (nonatomic, retain) NSString *actionID; //the action id
@property (nonatomic, retain) NSString *actionName; //the action name
@property (nonatomic, retain) NSDictionary *actionData; //the action payload (the JSON)

/**
 *  Factory method for a custom action object.
 *
 *  @param actionName the action name
 *  @param json       the action paylaod (a NSDictionary object)
 *
 *  @return the custom action.
 */

+ (VivochaCustomAction *) actionWithName:(NSString *)actionName andJSON:(NSDictionary *)json;

@end

