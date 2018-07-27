//
//  SFPath.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPath : NSObject

+ (NSString *)pathOfTemporary;
+ (NSString *)pathOfDocument;
+ (NSString *)pathOfCache;
+ (NSURL *)urlOfDocument;
+ (NSURL *)urlOfCache;

@end
