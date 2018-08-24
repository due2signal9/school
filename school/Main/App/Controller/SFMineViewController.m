//
//  SFMineViewController.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFMineViewController.h"
#import "SFMapManager.h"

@interface SFMineViewController ()

@end

@implementation SFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:SFLocalizedString(@"MINE")];
    [self setupCellMap];
    [self setupNavigationBar];
    [self initSubviews];
    [self setupSubviews];
}

- (void)setupCellMap {
    
    //暂时不用
}

- (void)setupNavigationBar {
    
    SFBarButtonItem *settingBtn = [[SFBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(gotoSettings)];
    [[self navigationItem] setRightBarButtonItem:settingBtn];
}

- (void)initSubviews {
    
    [self setMainTableView:[[SFTableView alloc] init]];
    [self setHeadView:[[SFMineHeadView alloc] init]];
    [[self headView] setBackgroundColor:[UIColor orangeColor]];
    
    [[self mainTableView] setTableHeaderView:[self headView]];
    [[self mainTableView] setTableFooterView:[[UIView alloc] init]];
    [[self mainTableView] setDelegate:self];
    [[self mainTableView] setDataSource:self];
    
    [[self mainTableView] setSectionHeaderHeight:.1f];
    [[self mainTableView] setSectionFooterHeight:.1f];
    
    [[self view] addSubview:[self mainTableView]];
}

- (void)setupSubviews {
    
    [[self mainTableView] mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSDictionary *mapDict = [[[SFMapManager mineCellMap] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[mapDict objectForKey:@"name"]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[SFMapManager mineCellMap] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
        {
            
            return [[[SFMapManager mineCellMap] objectAtIndex:0] count];
            break;
        }
        case 1:
        {
            
            return [[[SFMapManager mineCellMap] objectAtIndex:1] count];
            break;
        }
        default:
        {
            
            return 0;
            break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 15.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 15.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
    return;
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
