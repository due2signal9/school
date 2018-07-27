//
//  SFHttp.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "SFHttpBaseService.h"

@interface SFHttp : NSObject

@property(strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property(strong, nonatomic) AFNetworkReachabilityManager *reachabilityManager;

- (void)addRequest: (SFHttpBaseService *)service;
+ (SFHttp *)shared;

@end
