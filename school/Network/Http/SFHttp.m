//
//  SFHttp.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFHttp.h"

@implementation SFHttp

+ (SFHttp *)shared {
    
    static SFHttp *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[SFHttp alloc] init];
    });
    
    return _instance;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self)
    {
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [sessionManager setRequestSerializer:requestSerializer];
        [sessionManager setResponseSerializer:responseSerializer];
        
        [self setSessionManager: sessionManager];
        
        AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        [self setReachabilityManager:reachabilityManager];
    }
    
    return self;
}

- (void)addRequest:(SFHttpBaseService *)service {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];

    if ([service requestMethod] == GET)
    {
        
        [[self sessionManager] GET:[service buildHttpURL] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
            if ([service progressBridgeBlock])
                [service progressBridgeBlock](downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if([service successBridgeBlock])
                [service successBridgeBlock](task, responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if ( [service errorBridgeBlock] )
                [service errorBridgeBlock](task, error);
        }];
    }
    else if ([service requestMethod] == POST)
    {
        
        [[self sessionManager] POST:[service buildHttpURL] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            if ([service progressBridgeBlock])
                [service progressBridgeBlock](uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if ([service successBridgeBlock])
                [service successBridgeBlock](task, responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if ([service errorBridgeBlock])
                [service errorBridgeBlock](task, error);
        }];
    }
}

@end
