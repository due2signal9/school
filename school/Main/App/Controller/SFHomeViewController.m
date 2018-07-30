//
//  SFHomeViewController.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFHomeViewController.h"
#import "SFHttpApiGetHome.h"

@interface SFHomeViewController ()

@end

@implementation SFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:SFLocalizedString(@"SCHOOL_NOT_SELECTED")];
    [self initSubviews];
    [self setupSubviews];
}

- (void)initSubviews {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self setMainCollectionView:cv];
    [[self mainCollectionView] setDelegate:self];
    [[self mainCollectionView] setDataSource:self];
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestHome)];
    [[self mainCollectionView] setMj_header:mj_header];
    [[self view] addSubview:[self mainCollectionView]];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [[[self mainCollectionView] mj_header] beginRefreshing];
}

- (void)requestHome {
    
    SFHttpApiGetHome *api = [[SFHttpApiGetHome alloc] init];
    [api requestAsyncWithReturend:^(id response) {
        
        [[[self mainCollectionView] mj_header] endRefreshing];
    } withProgress:nil withError:^(NSError *error) {
        
        [SFNotice showHUDError:@"error"];
        [[[self mainCollectionView] mj_header] endRefreshing];
    }];
}

- (void)setupSubviews {
    
    [[self mainCollectionView] mas_makeConstraints:^(MASConstraintMaker *make) {
       
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
