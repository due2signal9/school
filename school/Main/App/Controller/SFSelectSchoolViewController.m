//
//  SFSelectSchoolViewController.m
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFSelectSchoolViewController.h"
#import "SFHttpApiGetSchool.h"

@interface SFSelectSchoolViewController ()

@end

@implementation SFSelectSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
    [self setupSubviews];
    // Do any additional setup after loading the view.
}

- (void)initSubviews {
    
    [self setMainTableView:[[SFTableView alloc] init]];
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestSchool)];
    [[self mainTableView] setDelegate:self];
    [[self mainTableView] setDataSource:self];
    [[self mainTableView] setMj_header:mj_header];
    [[self mainTableView] setTableFooterView:[[UIView alloc] init]];
}

- (void)setupSubviews {
    
    [[self mainTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)requestSchool {
    
    SFHttpApiGetSchool *api = [[SFHttpApiGetSchool alloc] init];
    [api requestAsyncWithReturend:^(id response) {
        
    } withProgress:nil withError:^(NSError *error) {
        
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = NSStringFromClass([self class]);
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:identifier];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self schoolData] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
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
