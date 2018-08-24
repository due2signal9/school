//
//  SFMapManager.m
//  school
//
//  Created by Meeno on 2018/8/24.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFMapManager.h"

static SFMapManager *_instance = nil;

@implementation SFMapManager

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[[self class] alloc] init];
    });
    
    return _instance;
}

+ (NSArray *)mineCellMap {
    
    return @[
  @[ //section 0
  @{
      @"name": @"我发布的",
      @"vcID": @"xxxController"
      },
  @{
      @"name": @"我求购的",
      @"vcID": @"xxxController"
      },
  @{
      @"name": @"我收藏的",
      @"vcID": @"xxxController"
      }
  ],
  @[ //section 1
  @{
      @"name": @"关于我们",
      @"vcID": @"xxxController"
      },
  @{
      @"name": @"加入我们",
      @"vcID": @"xxxController"
      }
  ]];
}

@end
