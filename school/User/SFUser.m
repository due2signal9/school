//
//  SFUser.m
//  school
//
//  Created by Oliver Mac on 2018/7/27.
//  Copyright © 2018年 rl. All rights reserved.
//

#import "SFUser.h"

@implementation SFUser

+ (SFUser *)shared {
    
    static SFUser *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self class] unarchive];
    });
    
    return _instance;
}

- (void)reset {
    
    [self setToken:nil];
    [self setPhone:nil];
    [self setEmail:nil];
    [self setUser_id:nil];
    [self setNickname:nil];
    [self setPassword:nil];
    [self setIs_auto_login:0];
}

- (instancetype)init {
    
    self = [super init];
    
    if (self)
    {
        
        [self reset];
        [self saveArchive];
    }
    
    return self;
}

+ (id)unarchive {
    
    SFUser *archive = [NSKeyedUnarchiver unarchiveObjectWithFile:[[self class] archivePath]];
    if (!archive)
    {
        
        archive = [[[self class] alloc] init];
    }
    
    return archive;
}

- (BOOL)saveArchive {
    
    BOOL isSuccess = [NSKeyedArchiver archiveRootObject:self toFile:[[self class] archivePath]];
    return isSuccess;
}

+ (NSString *)archivePath {
    
    NSString *path = [@"USER_LOCAL_INFO" stringByAppendingPathExtension:@"archive"];
    NSURL *url = [[NSFileManager defaultManager] URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];
    return [[url path] stringByAppendingPathComponent:path];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    return [self modelInitWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [self modelEncodeWithCoder:aCoder];
}

- (id)copyWithZone:(NSZone *)zone {
    
    return [self modelCopy];
}

- (void)logout {
    
    [self reset];
    [self saveArchive];
}

@end
