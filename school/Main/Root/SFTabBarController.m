//
//  SFTabBarController.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFTabBarController.h"
#import "SFHomeViewController.h"
#import "SFMineViewController.h"

@interface SFTabBarController ()

@end

@implementation SFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SFHomeViewController *homeVc = [[SFHomeViewController alloc] init];
    SFNavigationController *homeNav = [[SFNavigationController alloc] initWithRootViewController:homeVc];
    SFMineViewController *mineVc = [[SFMineViewController alloc] init];
    SFNavigationController *mineNav = [[SFNavigationController alloc] initWithRootViewController:mineVc];
    [self setViewControllers:@[homeNav, mineNav]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
