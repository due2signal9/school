//
//  SFHttpService.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFHttpService.h"
#import "SFServer.h"

@implementation SFHttpService

- (instancetype)init {
    
    self = [super init];
    return self;
}

- (void)requestSyncWithReturend:(SuccessBlock)successBlock withProgress:(ProgressBlock)progressBlock withError:(ErrorBlock)errorBlock {
    
    [self setProgressBridgeBlock:^(NSProgress *progress) {
        
        if (progressBlock)
            progressBlock(progress);
    }];
    
    SFWeakSelf(sSelf);
    [self setSuccessBridgeBlock: ^(NSURLSessionDataTask *task, id response) {
        
        if (successBlock)
            successBlock(response);
        [sSelf setTask: task];
        [sSelf setSuccessBridgeBlock: 0];
    }];
    
    SFWeakSelf(eSelf);
    [self setErrorBridgeBlock: ^(NSURLSessionDataTask *task, NSError *error) {
        
        if (errorBlock)
            errorBlock(error);
        [eSelf setTask: task];
        [eSelf setErrorBridgeBlock: 0];
        [eSelf setSuccessBridgeBlock: 0];
        [eSelf setProgressBridgeBlock: 0];
    }];
    
    [self beginRequest];
    NSLog(@"[%@ | %@] -> 你启动了一个同步网络请求", [self class], NSStringFromSelector(_cmd));
}

- (void)requestAsyncWithReturend:(SuccessBlock)successBlock withProgress:(ProgressBlock)progressBlock withError:(ErrorBlock)errorBlock {
    
    SFWeakSelf(pSelf);
    [self setProgressBridgeBlock: ^(NSProgress *progress) {
        
        if (progressBlock)
            progressBlock(progress);
        [pSelf setProgressBridgeBlock: 0];
    }];
    
    SFWeakSelf(sSelf);
    [self setSuccessBridgeBlock: ^(NSURLSessionDataTask *task, id response) {
        
        if (successBlock)
            successBlock(response);
        [sSelf setTask: task];
        [sSelf setSuccessBridgeBlock: 0];
        [sSelf setProgressBridgeBlock: 0];
    }];
    
    SFWeakSelf(eSelf);
    [self setErrorBridgeBlock: ^(NSURLSessionDataTask *task, NSError *error) {
        
        if (errorBlock)
            errorBlock(error);
        [eSelf setTask: task];
        [eSelf setErrorBridgeBlock: 0];
        [eSelf setSuccessBridgeBlock: 0];
        [eSelf setProgressBridgeBlock: 0];
    }];
    
    NSOperation *operation = [NSBlockOperation blockOperationWithBlock: ^{
        
        [self beginRequest];
    }];
    [[[NSOperationQueue alloc] init] addOperation: operation];
}

- (NSString *)baseURL {
    
#ifdef IS_DEV_SERVER
    return [SFServer getApiHostForServerType:@"dev"];
#else
    return [SFServer getApiHostForServerType:@"test"];
#endif
}

- (NSString *)port {
    
#ifdef IS_DEV_SERVER
    return [SFServer getApiHostPortForServerType:@"dev"];
#else
    return [SFServer getApiHostPortForServerType:@"test"];
#endif
}

- (void)resume {
    
    if ([self task])
        [[self task] resume];
}

- (void)suspend {
    
    if ([self task])
        [[self task] suspend];
}

- (void)cancel {
    
    if ([self task])
        [[self task] cancel];
}

@end
