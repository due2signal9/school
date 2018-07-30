//
//  SFMineViewController.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFBaseViewController.h"
#import "SFMineHeadView.h"

@interface SFMineViewController : SFBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) SFMineHeadView *headView;
@property(strong, nonatomic) SFTableView *mainTableView;

@end
