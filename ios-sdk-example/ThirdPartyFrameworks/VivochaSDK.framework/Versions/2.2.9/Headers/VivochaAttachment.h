//
//  VivochaAttachment.h
//  ios-sdk
//
//  Created by Michael Siddi on 19/06/15.
//  Copyright (c) 2015 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VivochaAttachmentType) {
    VivochaAttachmentTypeImage,
    VivochaAttachmentTypeVideo,
    VivochaAttachmentTypeAudio,
    VivochaAttachmentTypePDF,
    VivochaAttachmentTypeOther
};

typedef NS_ENUM(NSUInteger, VivochaAttachmentStatus) {
    VivochaAttachmentStatusUploading,
    VivochaAttachmentStatusFailed,
    VivochaAttachmentStatusOK,
    VivochaAttachmentStatusDownloading,
    VivochaAttachmentStatusUnknown
};

@class VivochaEvent;

@interface VivochaAttachment : VivochaObject

@property (nonatomic, retain) NSString *referenceId;
@property (nonatomic, assign) VivochaAttachmentType type;
@property (nonatomic, assign) VivochaAttachmentStatus status;
@property (nonatomic, assign) BOOL isOutgoing;

@property (nonatomic, retain) NSString *mimeType;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) id data;

@property (nonatomic, retain) NSString *filename;
@property (nonatomic, retain) NSString *desc;


+ (VivochaAttachment *) attachmentFromEvent:(VivochaEvent *)event;

@end
