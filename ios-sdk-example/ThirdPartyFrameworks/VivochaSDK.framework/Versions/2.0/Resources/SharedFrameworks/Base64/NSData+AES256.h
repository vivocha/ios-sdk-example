//
//  NSData+AES.h
//

@interface NSData (AES256)


- (NSData *)AES256EncryptWithKey:(NSData *)key;
- (NSData *)AES256DecryptWithKey:(NSData *)key;
- (NSData *)AES256EncryptWithKey:(NSData *)key andIV:(NSData *)iv;
- (NSData *)AES256DecryptWithKey:(NSData *)key andIV:(NSData *)iv;


@end
