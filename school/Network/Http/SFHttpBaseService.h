//
//  SFHttpBaseService.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

typedef void(^SuccessBridgeBlock)(NSURLSessionDataTask *task, id response);
typedef void(^ErrorBridgeBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void(^ProgressBridgeBlock)(NSProgress *progress);

typedef void(^SuccessBlock)(id response);
typedef void(^ProgressBlock)(NSProgress *progress);
typedef void(^ErrorBlock)(NSError *error);

typedef enum : NSUInteger {
    GET,
    POST,
} METHOD;

#import <Foundation/Foundation.h>

@interface SFHttpBaseService : NSObject

@property(copy, nonatomic) SuccessBridgeBlock successBridgeBlock;
@property(copy, nonatomic) ProgressBridgeBlock progressBridgeBlock;
@property(copy, nonatomic) ErrorBridgeBlock errorBridgeBlock;

- (instancetype)init;
- (NSString *)baseURL;
- (NSString *)port;
- (NSString *)requestURL;
- (NSDictionary *)requestArgument;
//- (NSString *)basicAuth;
//- (NSString *)token;
- (CGFloat)timeoutInterval;
- (METHOD)requestMethod;
//- (NSString *)buildHttpURL;
- (void)beginRequest;

@end
