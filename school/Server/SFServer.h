//
//  SFServer.h
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFServer : NSObject

+ (instancetype)shared;
+ (NSString *)getApiHostForServerType:(NSString *)type;
+ (NSString *)getApiHostPortForServerType:(NSString *)type;

@end
