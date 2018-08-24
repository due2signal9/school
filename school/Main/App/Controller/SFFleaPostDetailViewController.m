//
//  SFFleaPostDetailViewController.m
//  school
//
//  Created by Meeno on 2018/8/24.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFFleaPostDetailViewController.h"

@interface SFFleaPostDetailViewController ()

@end

@implementation SFFleaPostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
    [self setupSubviews];
}

- (void)initSubviews {
    
    [self setMainScrollView:[[UIScrollView alloc] initWithFrame:CGRectZero]];
    [[self view] addSubview:[self mainScrollView]];
}

- (void)setupSubviews {
    
    [[self mainScrollView] mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.insets(UIEdgeInsetsZero);
    }];
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
