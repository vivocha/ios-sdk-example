//
//  NSData+AES.h
//

#import <CommonCrypto/CommonCryptor.h>



@implementation NSData (AES256)

- (NSData *) cryptOperation:(CCOperation)operation withKey:(NSData *)keyData
  andIV: (NSData *)ivData {
    

    NSUInteger dataLength = [self length];
//    NSUInteger keyLength = [keyData length]; //32
//    NSUInteger ivLength = [ivData length]; //16

  //See the doc: For block ciphers, the output size will always be less than or
  //equal to the input size plus the size of one block.
  //That's why we need to add the size of one block here
  size_t bufferSize = dataLength + kCCBlockSizeAES128;
  void *buffer = malloc(bufferSize);

  size_t numBytesDecrypted = 0;
  CCCryptorStatus status = CCCrypt(operation, kCCAlgorithmAES128,
                                   kCCOptionPKCS7Padding,
                                   [keyData bytes], kCCKeySizeAES256,
                                   [ivData bytes],
                                   [self bytes], dataLength, /* input */
                                   buffer, bufferSize, /* output */
                                   &numBytesDecrypted);

  if (status == kCCSuccess) {
    //the returned NSData takes ownership of buffer and will free it on dealloc
    return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
  }

  free(buffer); //free the buffer;
  return nil;
}

- (NSData *)AES256EncryptWithKey:(NSData *)key andIV: (NSData *)iv {
  return [self cryptOperation:kCCEncrypt withKey:key andIV:iv];
}

- (NSData *)AES256DecryptWithKey:(NSData *)key andIV: (NSData *)iv {
  return [self cryptOperation:kCCDecrypt withKey:key andIV:iv];
}

- (NSData *)AES256EncryptWithKey:(NSData *)key {
  return [self cryptOperation:kCCEncrypt withKey:key andIV:nil];
}

- (NSData *)AES256DecryptWithKey:(NSData *)key {
  return [self cryptOperation:kCCDecrypt withKey:key andIV:nil];
}


@end