//
//  SFSelectSchoolTypeViewController.h
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFSelectSchoolTypeViewController : SFBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) SFTableView *mainTableView;
@property(strong, nonatomic) NSArray *schoolTypeData;

@end
