//
//  VivochaAgent.h
//  ios-sdk
//
//  Created by Michael Siddi on 13/11/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VivochaAgent : NSObject

@property (nonatomic, retain) NSString *name; //the agent name
@property (nonatomic, retain) NSString *avatarURL; //the agent avatar, if present

@end
