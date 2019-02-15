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

+ (void)saveToFile:(id)object {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *filename = [NSString stringWithFormat:@"%@-%@", [formatter stringFromDate:[NSDate date]],
                          [[FCUUID uuid] stringByAppendingString:@".log"]];
    
    filename = [path stringByAppendingPathComponent:filename];
    
    if ([object isKindOfClass:[NSString class]]) {
        
        NSString *str = (NSString *)object;
        [str writeToFile:filename atomically:YES encoding:NSUTF8StringEncoding error:nil];
    } else if ([object isKindOfClass:[NSArray class]]) {
        
        [(NSArray *)object writeToFile:filename atomically:YES];
    } else if ([object isKindOfClass:[NSDictionary class]]) {
        
        [(NSDictionary *)object writeToFile:filename atomically:YES];
    }
}

@end
