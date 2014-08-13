//
//  VivochaPage.h
//  ios-sdk
//
//  Created by Michael Siddi on 10/12/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VivochaPage : NSObject

@property (nonatomic, retain) NSString *title; //The title of the page.

+ (VivochaPage *) takeCurrentPage; //takes a screenshot and retrieves information from the current view controller.

@end
