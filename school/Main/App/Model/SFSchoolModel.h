//
//  SFSchoolModel.h
//  school
//
//  Created by Oliver Mac on 2018/8/7.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSchoolModel : NSObject

@property(strong, nonatomic) NSNumber *id;
@property(strong, nonatomic) NSNumber *category_id;
@property(strong, nonatomic) NSNumber *flea_id;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSNumber *sort;
@property(strong, nonatomic) NSNumber *is_deleted;
@property(strong, nonatomic) NSNumber *is_blocked;

@end
