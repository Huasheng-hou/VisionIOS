//
//  HHLogger.m
//  VisionIOS
//
//  Created by 华生侯 on 2019/2/3.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHLogger.h"

#import "signal.h"
#import <UIKit/UIKit.h>

void signal_handler(int signal) {
    
    NSLog(@"fucker!");
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"killed"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@implementation HHLogger

+ (void)start {
    signal(SIGSTOP, &signal_handler);
    signal(SIGKILL, &signal_handler);
    signal(SIGCHLD, &signal_handler);
    signal(SIGHUP, &signal_handler);
    signal(SIGSEGV, &signal_handler);
    signal(SIGABRT, &signal_handler);
}

+ (void)suspend {
    
}

+ (void)stop {
    
}

@end
