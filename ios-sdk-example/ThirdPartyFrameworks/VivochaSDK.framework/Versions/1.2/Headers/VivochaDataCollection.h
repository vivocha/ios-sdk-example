//
//  VivochaDataCollection.h
//  ios-sdk
//
//  Created by Michael Siddi on 28/10/13.
//  Copyright (c) 2013 Vivocha Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    VivochaDataCollectionFieldTypeDate, // string that contains a date in ISO8601 format (UTC)
    
    VivochaDataCollectionFieldTypeEmail, // string that contains an email address
    
    VivochaDataCollectionFieldTypeLink, // string that contains a link
    
    VivochaDataCollectionFieldTypeNickname, //string that contains the user nickname
    
    VivochaDataCollectionFieldTypeFirstName, //string
    
    VivochaDataCollectionFieldTypeLastName, //string
    
    VivochaDataCollectionFieldTypeNumber, // string that contains a number
    
    VivochaDataCollectionFieldTypePhone, //string that contains a phone number
    
    VivochaDataCollectionFieldTypeText, // string
    
    VivochaDataCollectionFieldTypeCheckbox, // string that contains a bool
    
    VivochaDataCollectionFieldTypePassword, // string

} VivochaDataCollectionFieldType;

@interface VivochaDataCollectionField : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, assign) VivochaDataCollectionFieldType type;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, assign) BOOL visible;
@property (nonatomic, assign) BOOL checked;

/**
 *  Factory method for a VivochaDataCollectionField object.
 *
 *  @param name     the field name
 *  @param type     the field type
 *  @param value    the field value
 *  @param desc     the field description
 *  @param visibile the field visibility
 *  @param checked  If the field type is a CheckBox, this parameter sets if the field is checked or not.
 *
 *  @return the field object.
 */
+ (VivochaDataCollectionField *) fieldWithName:(NSString *)name andType:(VivochaDataCollectionFieldType)type andValue:(NSString *)value andDescription:(NSString *)desc andIsVisibile:(BOOL)visibile andIsChecked:(BOOL)checked;

/**
 *  Initializes a VivochaDataCollectionField object.
 *
 *  @param name     the field name
 *  @param type     the field type
 *  @param value    the field value
 *  @param desc     the field description
 *  @param visibile the field visibility
 *  @param checked  If the field type is a CheckBox, this parameter sets if the field is checked or not.
 *
 *  @return the initializes field object.
 */
- (id) initWithName:(NSString *)name andType:(VivochaDataCollectionFieldType)type andValue:(NSString *)value andDescription:(NSString *)desc andIsVisibile:(BOOL)visibile andIsChecked:(BOOL)checked;

@end


@interface VivochaDataCollectionForm : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSMutableArray *data;

/**
 *  Factory method for a VivochaDataCollectionForm object.
 *
 *  @param name        the form name
 *  @param description the form descriptrion
 *
 *  @return the form object.
 */
+ (VivochaDataCollectionForm *) dataCollectionFormWithName:(NSString *)name andDescription:(NSString *)description;

/**
 *  Initializes a VivochaDataCollectionForm object
 *
 *  @param name        the form name
 *  @param description the form description
 *
 *  @return the initialized form object.
 */
- (id) initWithName: (NSString *) name andDescription:(NSString *)description;

/**
 *  Adds a field in a form.
 *
 *  @param field the field that will be added to the form.
 */
- (void) addField: (VivochaDataCollectionField *)field;
@end

@interface VivochaDataCollection : NSObject

@property (nonatomic, retain) NSMutableArray *forms;

/**
 *  Factory method that returns a VivochaDataCollection object.
 *
 *  @param formsArray the forms that will be included in the data collection.
 *
 *  @return the data collection.
 */

+ (VivochaDataCollection *) dataCollectionWithForms:(NSArray *)formsArray;

/**
 *  Adds a form in a data collection
 *
 *  @param aForm the form that will be added to the data collection.
 */
- (void) addForm:(VivochaDataCollectionForm *) aForm;

@end



