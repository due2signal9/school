//
//  SFMineViewController.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFMineViewController.h"

@interface SFMineViewController ()

@end

@implementation SFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:SFLocalizedString(@"MINE")];
    [self setupNavigationBar];
    [self initSubviews];
    [self setupSubviews];
}

- (void)setupNavigationBar {
    
    SFBarButtonItem *settingBtn = [[SFBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(gotoSettings)];
    [[self navigationItem] setRightBarButtonItem:settingBtn];
}

- (void)initSubviews {
    
    [self setMainTableView:[[SFTableView alloc] init]];
    [self setHeadView:[[SFMineHeadView alloc] init]];
    
    [[self mainTableView] setTableHeaderView:[self headView]];
    [[self mainTableView] setTableFooterView:[[UIView alloc] init]];
    [[self mainTableView] setDelegate:self];
    [[self mainTableView] setDataSource:self];
    
    
    [[self view] addSubview:[self mainTableView]];
}

- (void)setupSubviews {
    
    [[self mainTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (void)gotoSettings {
    
    
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
