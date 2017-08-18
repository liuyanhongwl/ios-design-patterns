//
//  Singleton.h
//  Singleton
//
//  Created by Hong on 2016/12/21.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SingletonH(name) + (instancetype)shared##name;

#define SingletonM(name)    \
static id instance = nil;   \
+ (instancetype)sharedInstance  \
{   \
    static dispatch_once_t onceToken;   \
    dispatch_once(&onceToken, ^{    \
        instance = [[[self class] alloc] init];  \
    }); \
    return instance;    \
}   \
    


@interface Singleton : NSObject///<NSCopying, NSMutableCopying>

@property (assign, nonatomic)int height;
@property (strong, nonatomic)NSObject *object;
@property (strong, nonatomic)NSMutableArray *array;

//+ (instancetype)sharedInstance;

SingletonH(Instance)

@end
