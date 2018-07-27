//
//  SFAppManager.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFAppManager.h"

static SFAppManager *_instance = nil;

@implementation SFAppManager

+ (SFAppManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[SFAppManager alloc] init];
    });
    
    return _instance;
}

+ (void)setup {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [[SFAppManager shared] setKeyWindow:window];
    [[SFAppManager shared] loadRootViewController];
    [[[SFAppManager shared] keyWindow] makeKeyAndVisible];
}

- (void)loadRootViewController
{
    
    int exist = [[[SFUser shared] user_id] intValue];
    if ( exist )
    {
        //
        //[[self keyWindow] setRootViewController:v20];
    }
    else
    {
        
//        SSLoginViewController *v24 = [[SSLoginViewController alloc] init];
//        SSNavigationController *v25 = [[SSNavigationController alloc] initWithRootViewController:v24];
//        [[self keyWindow] setRootViewController:v25];
    }
}

- (void)logout {
    
    [[SFUser shared] logout];
    [self loadRootViewController];
}

@end
