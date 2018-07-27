//
//  SFAppManager.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFAppManager : NSObject

@property(nonatomic, weak) UIWindow *keyWindow;

+ (SFAppManager *)shared;
+ (void)setup;
- (void)logout;

@end
