//
//  DMServiceProxy.m
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

#import "DMServiceProxy.h"
#import "AFNetworking.h"
#import "UserOC.h"
@implementation DMServiceProxy

- (void)getAllUSers:(void (^)(UserOC * users))completion 	{
    NSString * urlString = @"https://jsonplaceholder.typicode.com/users";
    
    /*
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
       [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200) {
            NSError *parseError = nil;
            NSMutableDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
         
            dispatch_sync(dispatch_get_main_queue(), ^{
                 completion(responseDic);
            });
           
        } else {
            NSLog(@"Errror");
        }
    }];
    
    [dataTask resume];
     */
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserOC *useroc = [[UserOC alloc ] init];
        useroc.name = responseObject[0][@"name"];
        useroc.userId = responseObject[0][@"id"];
        completion(useroc);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
  
}
@end
