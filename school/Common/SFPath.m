//
//  SFPath.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFPath.h"

@implementation SFPath

+ (NSString *)pathOfTemporary {
    
    return NSTemporaryDirectory();
}

+ (NSString *)pathOfDocument {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)pathOfCache {
    
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSURL *)urlOfDocument {
    
    return [[[NSFileManager defaultManager] URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask] lastObject];
}
+ (NSURL *)urlOfCache {
    
    return [[[NSFileManager defaultManager] URLsForDirectory: NSCachesDirectory inDomains: NSUserDomainMask] lastObject];
}

@end
