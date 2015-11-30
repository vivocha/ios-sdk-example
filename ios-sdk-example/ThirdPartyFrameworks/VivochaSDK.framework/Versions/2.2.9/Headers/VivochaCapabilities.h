//
//  VivochaCapabilities.h
//  ios-sdk
//
//  Created by Michael Siddi on 10/06/15.
//  Copyright (c) 2015 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VivochaCapabilitiesKeyPair : NSObject

+ (VivochaCapabilitiesKeyPair *) pairWithKey:(NSString *)key andValue:(BOOL)value;

@end

@interface VivochaCapabilitiesValue : NSObject
- (NSString *) getKey;
- (NSDictionary *) toJSON;
+ (VivochaCapabilitiesValue *) valueWithKey:(NSString *)key;
+ (VivochaCapabilitiesValue *) capsValueFromJSON:(NSDictionary *)json andParentKey:(NSString *)parentKey;

- (void) addEngine:(NSString *)engine andActive:(BOOL)active;
- (void) addEngine:(VivochaCapabilitiesKeyPair *)engine;
- (void) addKeyPair:(NSString *)key andActive:(BOOL)active;
- (void) addKeyPair:(VivochaCapabilitiesKeyPair *)pair;
- (void) addSubValue:(VivochaCapabilitiesValue *)subValue;
@end

@interface VivochaCapabilities : NSObject
+ (VivochaCapabilities *) capsFromJSON:(NSDictionary *)json;
- (NSDictionary *) toJSON;

- (void) addKey:(NSString *)key andCapsValue:(VivochaCapabilitiesValue *)value;
- (void) addKey:(NSString *)key andValue:(BOOL)value;
- (void) addValue:(VivochaCapabilitiesValue *)value;

- (BOOL) hasValue:(NSString *)key;
- (BOOL) getBooleanValue:(NSString *)key;
- (NSString *) getStringValue:(NSString *)key;
@end
