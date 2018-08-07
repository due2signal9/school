//
//  SFHttpApiGetSchool.m
//  school
//
//  Created by Oliver Mac on 2018/7/30.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFHttpApiGetSchoolList.h"

@implementation SFHttpApiGetSchoolList

- (NSString *)requestURL {
    
    return @"/school/list";
}

- (NSDictionary *)requestParams {
    
    if (![self category_id] || [[self category_id] isEqualToNumber:[NSNumber numberWithInteger:0]])
        return nil;
    return @{@"category_id": [self category_id]};
}

@end
