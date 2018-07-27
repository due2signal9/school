//
//  AppDelegate+SFSetup.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "AppDelegate+SFSetup.h"
#import <Reachability/Reachability.h>

@implementation AppDelegate (SFSetup)

- (void)setupReachability {
    
    Reachability *reachAbility = [Reachability reachabilityWithHostName:@"www.xxx.com"];
    [reachAbility startNotifier];
}

@end
