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
   
    NSLog(@"signal catched!\n");
    NSArray *symbols = [NSThread callStackSymbols];
    [HHLogger saveToFile:symbols];
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
