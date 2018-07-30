//
//  SFNotice.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TSMessages/TSMessage.h>

@interface SFNotice : NSObject

+ (void)showTSMessage:(NSString *)message type:(TSMessageNotificationType)type;
+ (void)showTSMessage:(NSString *)message type:(TSMessageNotificationType)type duration: (NSTimeInterval)duration;
+ (void)showTSTitle:(NSString *)title message:(NSString *)message type: (TSMessageNotificationType)type;
+ (void)showTSTitle:(NSString *)title message:(NSString *)message type:(TSMessageNotificationType)type duration:(NSTimeInterval)duration;

+ (void)showHUDError:(id)error;
+ (void)showHUDSuccess:(NSString *)message;
+ (void)showHUDMessage:(NSString *)message;

@end
