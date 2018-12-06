//
//  HHGcdController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/2.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHGcdController.h"
#import "Colors.h"

extern uintptr_t _objc_rootRetainCount(id obj);
extern void _objc_autoreleasePoolPrint(void);

@interface HHGcdController ()

@end

@implementation HHGcdController

+ (instancetype)createController {
    
    return [[HHGcdController alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BG_COLOR;
    [self _initViews];
}

- (void)_initViews  {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.text = @"开始";
    
    button.center = self.view.center;
    button.bounds = CGRectMake(0, 0, 80, 35);
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(startConcurrentQueues) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)startConcurrentQueues {

    for (int i = 0; i <= 1000; i ++) {
        
        NSArray *array = [NSArray array];
    }
    _objc_autoreleasePoolPrint();
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t queue1 = dispatch_queue_create_with_target("com.hh.serialQueue1",
                                                                DISPATCH_QUEUE_SERIAL, globalQueue);
    dispatch_queue_t queue2 = dispatch_queue_create_with_target("com.hh.serialQueue2",
                                                                DISPATCH_QUEUE_SERIAL, globalQueue);
    for (int i = 0; i < 50; i++) {
        
        int time = random() % 5;
        if (i % 2 == 0) {
            
            dispatch_async(queue1, ^{
               
                NSLog(@"start task %d", i);
                @autoreleasepool {
                    id obj = [NSArray array];
                    id obj1 = [NSArray array];
                    NSLog(@"obj1:%p", obj);
                    NSLog(@"obj2:%p", obj1);
                    _objc_autoreleasePoolPrint();
                }
                sleep(time);
                NSLog(@"end task %d", i);
            });
        } else {
            
            dispatch_async(queue2, ^{
                
                NSLog(@"queue 2 start task %d", i);
                sleep(time);
                NSLog(@"queue 2 end task %d", i);
            });
        }
    }
}

@end
