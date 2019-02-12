//
//  HHLogger.m
//  VisionIOS
//
//  Created by 华生侯 on 2019/2/3.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHLogger.h"

@implementation HHLogger

+ (void)start {
    
}

+ (void)suspend {
    
}

+ (void)stop {
    
}

+ (void)saveToFile:(id)object {
    
    NSString *path = NSHomeDirectory();
    [(NSArray *)object writeToFile:[path stringByAppendingString:@"/tt"] atomically:YES];
}

@end
