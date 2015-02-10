//
//  VivochaLocalization.h
//  ios-sdk
//
//  Created by Michael Siddi on 01/09/14.
//  Copyright (c) 2014 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VivochaLocalization : NSObject

@property (nonatomic, retain) NSString *language;

+ (VivochaLocalization *)localizationWithLanguage:(NSString *)lang;

- (id) initWithLanguage:(NSString *)lang;

- (void) setTranslation:(NSString *)translation forKey:(NSString *)key;

- (NSString *) getTranslationForKey:(NSString *)key;

- (NSArray *) translatedKeys;

@end
