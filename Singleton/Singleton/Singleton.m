//
//  Singleton.m
//  Singleton
//
//  Created by Hong on 2016/12/21.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "Singleton.h"

//static Singleton *instance = nil;

@implementation Singleton

- (NSString *)description
{
    NSString *result = @"";
    result = [result stringByAppendingFormat:@"<%@: %p>",[self class], self];
    result = [result stringByAppendingFormat:@" height = %d,",self.height];
    result = [result stringByAppendingFormat:@" array = %p,",self.array];
    result = [result stringByAppendingFormat:@" object = %p,",self.object];
    return result;
}


//方法一误：线程不安全
//+ (instancetype)sharedInstance
//{
//    if (!instance) {
//        instance = [[Singleton alloc] init];
//    }
//    return instance;
//}



//方法二误：不全面，用其他方法创建，会使单例不唯一
//+ (instancetype)sharedInstance
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[Singleton alloc] init];
//    });
//    return instance;
//}
//或
//+ (instancetype)sharedInstance
//{
//    @synchronized (self) {
//        if (!instance) {
//            instance = [[Singleton alloc] init];
//        }
//    }
//    return instance;
//}




//方法三误：单例对象唯一，但是不同的方式调用，会多次初始化单例的属性。
//+ (instancetype)sharedInstance
//{
//    @synchronized (self) {
//        if (!instance) {
//            instance = [[Singleton alloc] init];
//        }
//    }
//    return instance;
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super allocWithZone:zone];
//    });
//    return instance;
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _height = 10;
//        _object = [[NSObject alloc] init];
//        _array = [[NSMutableArray alloc] init];
//    }
//    return self;
//}
//




//方法四：完整写法，保证了单例的唯一，也保证了属性初始化的唯一。
//+ (instancetype)sharedInstance
//{
//    return [[Singleton alloc] init];
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super allocWithZone:zone];
//    });
//    return instance;
//    
////    @synchronized (self) {
////        if (!instance) {
////            instance = [super allocWithZone:zone];
////        }
////    }
////    return instance;
//    
////    if (!instance) {
////        @synchronized (self) {
////            if (!instance) {
////                instance = [super allocWithZone:zone];
////            }
////        }
////    }
////    return instance;
//}
//
//- (instancetype)init
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super init];
//        if (instance) {
//            instance.height = 10;
//            instance.object = [[NSObject alloc] init];
//            instance.array = [[NSMutableArray alloc] init];
//        }
//    });
//    return instance;
//}





//方法五：使用+initialize方法
//+ (void)initialize
//{
//    if ([self class] == [Singleton class] && instance == nil) {
//        instance = [[Singleton alloc] init];
//        instance.height = 10;
//        instance.object = [[NSObject alloc] init];
//        instance.array = [[NSMutableArray alloc] init];
//    }
//}
//
//+ (instancetype)sharedInstance
//{
//    return instance;
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    if (instance == nil) {
//        instance = [super allocWithZone:zone];
//    }
//    return instance;
//}
//


//方法六：使用宏
SingletonM(Instance)


//copy & mutable copy

//- (id)copyWithZone:(NSZone *)zone
//{
//    return instance;
//}
//
//- (id)mutableCopyWithZone:(NSZone *)zone
//{
//    return instance;
//}

@end
