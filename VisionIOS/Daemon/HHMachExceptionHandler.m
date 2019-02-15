//
//  HHMachExceptionHandler.m
//  VisionIOS
//
//  Created by shen on 2019/2/14.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHMachExceptionHandler.h"
#import "HHLogger.h"
#import "mach/mach.h"

@implementation HHMachExceptionHandler

// Handle EXCEPTION_DEFAULT behavior
kern_return_t catch_mach_exception_raise (mach_port_t exception_port,
                                          mach_port_t thread,
                                          mach_port_t task,
                                          exception_type_t exception,
                                          mach_exception_data_t code,
                                          mach_msg_type_number_t codeCnt)
{
    // Do smart stuff here.
    fprintf(stderr, "My exception handler was called by exception_raise()\n");
    [HHLogger saveToFile:@"fucked!"];

    // Inform the kernel that we haven't handled the exception, and the
    // next handler should be called.
    return KERN_FAILURE;
}

@end
