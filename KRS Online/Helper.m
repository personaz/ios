//
//  Helper.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "Helper.h"

@implementation Helper

static const NSString* mainUrl = @"http://api";
static const NSString* LoginUrl = @"http://api/login.php";

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
    return getReturn;
}

- (NSDictionary *)getMahasiswaDetailByNIMAndStoreIt:(NSString *)nim {
    NSString* param = [NSString stringWithFormat:@"%@/msiswa.php", mainUrl];
    NSURL* link = [NSURL URLWithString:param];
    
    NSDictionary* sendServer = @{@"nim": nim};
    NSError* error;
    NSData* dataPost = [NSJSONSerialization dataWithJSONObject:sendServer options:0 error:&error];
    
    NSMutableURLRequest *request = [self createPostMutableURLRequestWithData:dataPost toURL:link];
    NSHTTPURLResponse *response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary* dataReturn = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    /** store dataReturn to core data */
    return dataReturn;
}
@end
