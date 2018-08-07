//
//  SFSelectSchoolViewController.m
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFSelectSchoolViewController.h"
#import "SFHttpApiGetSchoolList.h"
#import "SFSchoolModel.h"

@interface SFSelectSchoolViewController ()

@end

@implementation SFSelectSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setTitle:SFLocalizedString(@"SCHOOL_TYPE")];
    [self setSchoolList:[NSMutableArray arrayWithCapacity:20]];
    _is_first_load = YES;
    [self initSubviews];
    [self setupSubviews];
}

- (void)initSubviews {
    
    UISearchController *sc = [[UISearchController alloc] initWithSearchResultsController:nil];
    [self setSearchController:sc];
    [[self searchController] setDelegate:self];
    [[self searchController] setSearchResultsUpdater:self];
    [[[self searchController] searchBar] setPlaceholder:@"请输入关键字搜索"];
    
    [self setMainTableView:[[SFTableView alloc] init]];
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestSchool)];
    [[self mainTableView] setDelegate:self];
    [[self mainTableView] setDataSource:self];
    [[self mainTableView] setMj_header:mj_header];
    [[self mainTableView] setTableFooterView:[[UIView alloc] init]];
    
    [[self mainTableView] setTableHeaderView:[[self searchController] searchBar]];
    [[self view] addSubview:[self mainTableView]];
    [[[self searchController] searchBar] sizeToFit];
}

- (void)setupSubviews {
    
    [[self mainTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if (_is_first_load)
        [self requestSchool];
    _is_first_load = NO;
}

- (void)requestSchool {
    
    SFHttpApiGetSchoolList *api = [[SFHttpApiGetSchoolList alloc] init];
    [api setCategory_id:[self schoolType]];
    [api requestAsyncWithReturend:^(id response) {
        
        id data = [NSJSONSerialization JSONObjectWithData:response options:1 error:0];
        
        if ([data isKindOfClass:[NSDictionary class]])
        {
            
            NSArray *schools = [data objectForKeyedSubscript:@"data"];
            [[self schoolList] removeAllObjects];
            for (NSDictionary *school in schools)
            {
                
                SFSchoolModel *model = [SFSchoolModel modelWithDictionary:school];
                [[self schoolList] addObject:model];
            }
        }
        
        [[self mainTableView] reloadData];
    } withProgress:nil withError:^(NSError *error) {
        
        [SFNotice showHUDError:@"[SFHttpApiGetSchoolList] request error"];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = NSStringFromClass([self class]);
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:identifier];
    NSString *title = [[[self schoolList] objectAtIndex:[indexPath row]] name];
    [[cell textLabel] setText:title];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self schoolList] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //发送通知通知homevc更改学校并获取新的信息
    //直接显示homevc 并获取新的学校信息
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
