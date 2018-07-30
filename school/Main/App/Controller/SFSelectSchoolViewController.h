//
//  SFSelectSchoolViewController.h
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFSelectSchoolViewController : SFBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) SFTableView *mainTableView;
@property(strong, nonatomic) NSArray *schoolData;
@property(copy, nonatomic) NSNumber *schoolType;

@end
