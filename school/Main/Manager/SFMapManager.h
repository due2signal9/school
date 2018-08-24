//
//  SFMapManager.h
//  school
//
//  Created by Meeno on 2018/8/24.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFMapManager : NSObject

+ (instancetype)shared;
+ (NSArray *)mineCellMap;

@end
