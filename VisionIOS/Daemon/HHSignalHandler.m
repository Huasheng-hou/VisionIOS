//
//  HHSignalHandler.m
//  VisionIOS
//
//  Created by 华生侯 on 2019/2/4.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHSignalHandler.h"
#import "HHLogger.h"
#import "signal.h"

@implementation HHSignalHandler

void signalHandler(int signal) {
    //    NSString *str = (__bridge NSString *)(param);
    // 用循环模拟耗时操作
    //    for (int i = 0; i < 100000; i++) {
    //        // [NSThread currentThread] 为获取当前
    //        NSLog(@"timeConsuming in %@, times: %d, param: %@", [NSThread currentThread], i, str);
    //    }
//    sem_wait(sem);
    NSLog(@"signal catched!\n");
    NSArray *symbols = [NSThread callStackSymbols];
    [HHLogger saveToFile:symbols];
    
//    sleep(5);
//    NSLog(@"first thread post!\n");
//    sem_post(sem);
//    pthread_exit((void*)0);
}

+ (void)install {
    
    signal(SIGINT, &signalHandler);
    signal(SIGSEGV, &signalHandler);
    signal(SIGKILL, &signalHandler);
    signal(SIGINT, &signalHandler);
    signal(SIGABRT, &signalHandler);
    signal(SIGINT, &signalHandler);
    
    
}

@end
