//
//  SFSelectSchoolViewController.h
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFSelectSchoolViewController : SFBaseViewController<UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating>
{
    
    BOOL _is_first_load;
}

@property(strong, nonatomic) UISearchController *searchController;
@property(strong, nonatomic) SFTableView *mainTableView;
@property(strong, nonatomic) NSMutableArray *schoolList;
@property(copy, nonatomic) NSNumber *schoolType;

@end
