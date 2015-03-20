//
//  Helper.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "Helper.h"

@implementation Helper

static const NSString* LoginUrl = @"http://192.168.0.1/login.php";

- (NSDictionary *)processLoginWithNIM:(NSString *)nim andPassword:(NSString *)password {
    NSString* param = [NSString stringWithFormat:@"%@", LoginUrl];
    NSURL* url = [NSURL URLWithString:param];
    
    NSDictionary* toServer = @{@"nim": nim, @"password": password};
    NSError* error;
    NSData* dataToPost = [NSJSONSerialization dataWithJSONObject:toServer options:0 error:&error];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:dataToPost];
    
    NSHTTPURLResponse* response;
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary* getReturn = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    return getReturn;
}
@end
