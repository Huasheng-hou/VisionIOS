//
//  HHStack.m
//  VisionIOS
//
//  Created by shen on 2019/1/11.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHStack.h"

#define MAX_COUNT 40

@interface HHStack ()

@property (atomic, assign, readwrite) int stackSize;

@end

@implementation HHStack
{
    int * _arr;
    int * _top;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        _arr = calloc(MAX_COUNT, sizeof(int));
        _top = _arr - 1;
        _stackSize = 0;
    }
    return self;
}

- (BOOL)push:(int)number {
    
    _top ++;
    if (_top > (_arr + MAX_COUNT)) {
        
        return NO;
    }
    
    *_top = number;
    _stackSize ++;
    return YES;
}

- (int)pop {
    
    if (_stackSize) {
        
        int number = *_top;
        _top --;
        _stackSize --;
        return number;
    }
    return 0;
}

@end
