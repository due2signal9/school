//
//  SFCommon.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFCommon.h"

@implementation SFCommon

+ (void)runOnMainThreadWithBlock:(MainThreadBlock)block {
    
    if ([NSThread isMainThread])
    {
        
        block();
    }
    else
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block();
        });
    }
}

+ (UIWindow *)sf_keyWindow {
    
    return [UIApplication sharedApplication].keyWindow;
}

@end
