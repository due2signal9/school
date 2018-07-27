//
//  SFHttpService.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFHttpBaseService.h"

@interface SFHttpService : SFHttpBaseService

@property(strong, nonatomic) NSURLSessionTask *task;

- (void)resume;
- (void)suspend;
- (void)cancel;

- (void)requestAsyncWithReturend: (SuccessBlock)successBlock withProgress: (ProgressBlock)progressBlock withError: (ErrorBlock)errorBlock;
- (void)requestSyncWithReturend: (SuccessBlock)successBlock withProgress: (ProgressBlock)progressBlock withError: (ErrorBlock)errorBlock;

@end
