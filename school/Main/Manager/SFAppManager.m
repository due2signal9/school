//
//  SFAppManager.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFAppManager.h"
#import "SFLoginViewController.h"
#import "SFHomeViewController.h"
#import "SFTabBarController.h"

static SFAppManager *_instance = nil;

@implementation SFAppManager

+ (SFAppManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[SFAppManager alloc] init];
    });
    
    return _instance;
}

- (instancetype)init {
    
    self = [super init];
    NSNumber *choosedSchool = [[NSUserDefaults standardUserDefaults] objectForKey:@"SF_CHOOSED_SCHOOL"];
    if ([choosedSchool intValue])
        self->_sf_school = choosedSchool;
    else
        self->_sf_school = [NSNumber numberWithInteger:0];
    return self;
}

- (void)setSf_school:(NSNumber *)sf_school {
    
    self->_sf_school = sf_school;
    [[NSUserDefaults standardUserDefaults] setObject:sf_school forKey:@"SF_CHOOSED_SCHOOL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setup {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [[SFAppManager shared] setKeyWindow:window];
    [[SFAppManager shared] loadRootViewController];
    [[[SFAppManager shared] keyWindow] makeKeyAndVisible];
}

- (void)loadRootViewController
{
    
    //NSNumber *choosedSchool = [[NSUserDefaults standardUserDefaults] objectForKey:@"SF_CHOOSED_SCHOOL"];
    
    SFTabBarController *hRoot = [[SFTabBarController alloc] init];
    [[self keyWindow] setRootViewController:hRoot];
//    int exist = [[[SFUser shared] user_id] intValue];
//    if ( exist )
//    {
//
//        SFHomeViewController *home = [[SFHomeViewController alloc] init];
//        [[self keyWindow] setRootViewController:home];
//    }
//    else
//    {
//
//        SFLoginViewController *lvc = [[SFLoginViewController alloc] init];
//        SFNavigationController *nav = [[SFNavigationController alloc] initWithRootViewController:lvc];
//        [[self keyWindow] setRootViewController:nav];
//    }
}

- (void)logout {
    
    [[SFUser shared] logout];
    [self loadRootViewController];
}

@end
