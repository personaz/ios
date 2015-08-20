//
//  Helper.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "Helper.h"
#import "ModelMapper.h"

@implementation Helper

// static const NSString* mainUrl = @"http://api";
// static const NSString* LoginUrl = @"http://api/login.php";
static const NSString* mainUrl = @"http://www.krsonline-muhzulham.com";
static const NSString* LoginUrl = @"http://www.krsonline-muhzulham.com/login.php";

- (NSMutableURLRequest* )createPostMutableURLRequestWithData:(NSData* )dataPost toURL:(NSURL* )url {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:dataPost];
    return request;
}

- (NSDictionary *)processLoginWithNIM:(NSString *)nim andPassword:(NSString *)password {
    NSString* param = [NSString stringWithFormat:@"%@", LoginUrl];
    NSURL* url = [NSURL URLWithString:param];
    
    NSDictionary* toServer = @{@"nim": nim, @"password": password};
    NSError* error;
    NSData* dataToPost = [NSJSONSerialization dataWithJSONObject:toServer options:0 error:&error];
    
    NSMutableURLRequest *request = [self createPostMutableURLRequestWithData:dataToPost toURL:url];
    NSHTTPURLResponse* response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary* getReturn = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSLog(@"%@", getReturn);
    return getReturn;
}

- (void)getMahasiswaDetailByNIMAndStoreIt:(NSString *)nim {
    NSString* param = [NSString stringWithFormat:@"%@/msiswa.php", mainUrl];
    NSURL* link = [NSURL URLWithString:param];
    
    NSDictionary* sendServer = @{@"nim": nim};
    NSError* error;
    NSData* dataPost = [NSJSONSerialization dataWithJSONObject:sendServer options:0 error:&error];
    
    NSMutableURLRequest *request = [self createPostMutableURLRequestWithData:dataPost toURL:link];
    NSHTTPURLResponse *response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary* dataReturn = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    ModelMapper* mapper = [[ModelMapper alloc] init];
    [mapper saveMahasiswa:dataReturn];
}

- (void)getAllNewsAndSaveItWithNIM:(NSString *)nim {
    NSString* param = [NSString stringWithFormat:@"%@/news.php", mainUrl];
    NSURL* link = [NSURL URLWithString:param];
    
    NSDictionary* sendServer = @{@"nim": nim};
    NSError* error;
    NSData* dataToPost = [NSJSONSerialization dataWithJSONObject:sendServer options:0 error:&error];
    
    NSMutableURLRequest* request = [self createPostMutableURLRequestWithData:dataToPost toURL:link];
    NSHTTPURLResponse* response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSArray* dataReturn = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    ModelMapper* mapper = [[ModelMapper alloc] init];
    [mapper saveNews:dataReturn];
}

- (BOOL)changePasswordFromOld:(NSString *)oldPassword toNew:(NSString *)newPassword withNIM:(NSString *)NIM {
    NSString* param = [NSString stringWithFormat:@"%@/password.php", mainUrl];
    NSURL* link = [NSURL URLWithString:param];
    
    NSDictionary* toServer = @{@"nim": NIM, @"old": oldPassword, @"new": newPassword};
    NSError* error;
    NSData* postData = [NSJSONSerialization dataWithJSONObject:toServer options:0 error:&error];
    
    NSMutableURLRequest* request = [self createPostMutableURLRequestWithData:postData toURL:link];
    NSHTTPURLResponse* response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSArray* returnResponse = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    if ([[returnResponse valueForKey:@"response"] isEqualToString:@"success"]) {
        return YES;
    }
    return NO;
}
@end
