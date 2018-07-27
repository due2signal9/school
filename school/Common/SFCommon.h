//
//  SFCommon.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

typedef void(^MainThreadBlock)(void);

#import <Foundation/Foundation.h>

@interface SFCommon : NSObject

+ (void)runOnMainThreadWithBlock:(MainThreadBlock)block;
+ (UIWindow *)sf_keyWindow;

@end
