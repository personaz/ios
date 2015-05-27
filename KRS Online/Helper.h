//
//  Helper.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

- (NSDictionary* )processLoginWithNIM:(NSString* )nim andPassword:(NSString* )password;
- (void)getMahasiswaDetailByNIMAndStoreIt:(NSString* )nim;

- (void)getAllNewsAndSaveItWithNIM:(NSString*)nim;

- (BOOL)changePasswordFromOld:(NSString*)oldPassword toNew:(NSString*)newPassword withNIM:(NSString*)NIM;
@end
