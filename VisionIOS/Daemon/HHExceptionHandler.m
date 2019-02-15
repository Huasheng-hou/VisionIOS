//
//  HHExceptionHandler.m
//  VisionIOS
//
//  Created by shen on 2019/2/13.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHExceptionHandler.h"

void HandleException(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    NSLog(@"%@", exceptionInfo);
    [HHLogger saveToFile:exceptionInfo];
}

void InstallUncaughtExceptionHandler(void)
{
    NSSetUncaughtExceptionHandler(&HandleException);
}

@implementation HHExceptionHandler

@end
