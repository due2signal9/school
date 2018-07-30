//
//  SFNotice.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFNotice.h"
#import "SFCommon.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation SFNotice

+ (void)showTSSuccess:(NSString *)message {
    
    
}

+ (void)showTSError:(id)error {
    
    if ([error isKindOfClass:[NSString class]])
    {
        
        
    }
    else if ([error isKindOfClass:[NSError class]])
    {
        
        
    }
}

+ (void)showTSSuccessWithTitle:(NSString *)title message:(NSString *)message {
    
    
}

+ (void)showTSErrorWithTitle:(NSString *)title message:(NSString *)message {
    
    
}

+ (void)showTSMessage:(NSString *)message type:(TSMessageNotificationType)type {
    
}

+ (void)showTSMessage:(NSString *)message type:(TSMessageNotificationType)type duration:(NSTimeInterval)duration {
    
}

+ (void)showTSTitle:(NSString *)title message:(NSString *)message type:(TSMessageNotificationType)type {
    
    [[self class] showTSTitle:title message:message type:type duration:2.0];
}

+ (void)showTSTitle:(NSString *)title message:(NSString *)message type:(TSMessageNotificationType)type duration:(NSTimeInterval)duration {
    
    [TSMessage showNotificationInViewController:[TSMessage defaultViewController] title:title subtitle:message type:type duration:duration];
}

+ (void)showHUDSuccess:(NSString *)message {
    

}

+ (void)showHUDError:(id)error {
    
    if ([error isKindOfClass:[NSString class]])
    {
        
        
    }
    else if ([error isKindOfClass:[NSError class]])
    {
        
        
    }
}

+ (void)showHUDMessage:(NSString *)message {
    
    [SFCommon runOnMainThreadWithBlock:^{
       
        [[self class] showHUDMessage:message inView:[SFCommon sf_keyWindow]];
    }];
}

+ (void)showHUDTitle:(NSString *)title subTitlte:(NSString *)subTitle {
    
    [SFCommon runOnMainThreadWithBlock:^{
       
        [[self class] showHUDTitle:title subTitlte:subTitle inView:[SFCommon sf_keyWindow]];
    }];
}

+ (void)showHUDMessage:(NSString *)message inView:(UIView *)view {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:1];
    [hud setMode:MBProgressHUDModeText];
    [[hud label] setText:message];
    [hud hideAnimated:1 afterDelay:2.0];
}

+ (void)showHUDTitle:(NSString *)title subTitlte:(NSString *)subTitle inView:(UIView *)view {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:1];
    [[hud label] setText:title];
    [[hud detailsLabel] setText:subTitle];
    [hud setRemoveFromSuperViewOnHide:1];
}


@end
