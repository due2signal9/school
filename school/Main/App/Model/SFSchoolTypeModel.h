//
//  SFSchoolTypeModel.h
//  school
//
//  Created by Oliver Mac on 2018/8/6.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSchoolTypeModel : NSObject

@property(copy, nonatomic) NSNumber *id;
@property(copy, nonatomic) NSString *title;
@property(copy, nonatomic) NSNumber *sort;
@property(copy, nonatomic) NSNumber *is_deleted;
@property(copy, nonatomic) NSNumber *is_blocked;

@end
