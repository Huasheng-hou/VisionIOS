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
#import "BSBacktraceLogger.h"

@implementation HHSignalHandler

void signalHandler(int sig) {
   
    NSLog(@"signal catched!\n");
    NSString *symbols = [BSBacktraceLogger bs_backtraceOfAllThread];
    [HHLogger saveToFile:[NSString stringWithFormat:@"Unix Signal:%@\n%@", signaleName(sig), symbols]];
    
    signal(sig, SIG_DFL);
}

+ (void)install {
    
    signal(SIGABRT, &signalHandler);
    signal(SIGALRM, &signalHandler);
    signal(SIGFPE, &signalHandler);
    signal(SIGILL, &signalHandler);
    signal(SIGHUP, &signalHandler);
    signal(SIGINT, &signalHandler);
    signal(SIGKILL, &signalHandler);
    signal(SIGTERM, &signalHandler);
    signal(SIGSTOP, &signalHandler);
    signal(SIGSEGV, &signalHandler);
    signal(SIGBUS, &signalHandler);
    signal(SIGPIPE, &signalHandler);
}

NSString *signaleName(int signal) {
    
    switch (signal) {
        case SIGABRT:       // * 程序终止命令
            return @"SIGABRT";
            break;
        case SIGALRM:       // * 超时
            return @"SIGALRM";
            break;
        case SIGFPE:        // * 浮点异常
            return @"SIGFPE";
            break;
        case SIGILL:        // * 非法指令
            return @"SIGILL";
            break;
        case SIGHUP:        // * 终端终止
            return @"SIGHUP";
            break;
        case SIGINT:        // * 来自键盘的中断
            return @"SIGINT";
            break;
        case SIGSEGV:       // * 无效的内存引用（段故障）
            return @"SIGSEGV";
            break;
        case SIGKILL:       // * 杀死程序
            return @"SIGKILL";
            break;
            
        default:
            break;
    }
    return nil;
}

@end
