//
//  SFHomeViewController.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFHomeViewController : SFBaseViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic) UICollectionView *mainCollectionView;

@end
