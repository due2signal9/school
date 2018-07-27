//
//  SFUser.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFUser : NSObject<NSCoding, NSCopying>

@property(nonatomic, copy) NSString *user_id;
@property(nonatomic, copy) NSNumber *is_auto_login;
@property(nonatomic, copy) NSString *nickname;
@property(nonatomic, copy) NSString *phone;
@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy) NSString *token;

+ (SFUser *)shared;
- (void)logout;
- (BOOL)saveArchive;

@end
