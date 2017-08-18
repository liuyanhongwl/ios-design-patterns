//
//  ViewController.m
//  Singleton
//
//  Created by Hong on 2016/12/21.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //测试单例创建唯一。
//    Singleton *s = [Singleton sharedInstance];
//    NSLog(@"%@", s);
//    s = [[Singleton alloc] init];
//    NSLog(@"%@", s);
//    s = [Singleton new];
//    NSLog(@"%@", s);
////    s = [s copy];
////    NSLog(@"%@", s);
////    s = [s mutableCopy];
////    NSLog(@"%@", s);
//    
//    return;
    
    
    //测试多次异步调用单例
    NSLog(@"开始空转");
    for (int i=0; i<10000000; i++) {
    }
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_apply(1000000, queue, ^(size_t ix) {
        Singleton *s = [Singleton sharedInstance];
        NSLog(@"index:%lu singletion:%@", ix, s);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"用时：%lf", CFAbsoluteTimeGetCurrent()-startTime);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
