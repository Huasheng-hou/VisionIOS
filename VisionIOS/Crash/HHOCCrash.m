//
//  HHOCCrash.m
//  VisionIOS
//
//  Created by shen on 2019/2/13.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHOCCrash.h"

@implementation HHOCCrash

+ (void)crash_unRecognizedSelector {

    
}

+ (void)crash_ArrayOutOfBound {
    
    NSArray *arr = @[];
    [arr objectAtIndex:10];
}

+ (void)crash_DanglingPointer {
    
    __unsafe_unretained id obj = [[NSObject alloc] init];
    [obj performSelector:@selector(isKindOfClass:)];
}

@end
