//
//  HHQueue.m
//  VisionIOS
//
//  Created by shen on 2019/1/11.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHQueue.h"

#define MAX_COUNT 40

@interface HHQueue ()

@property (atomic, assign, readwrite) int queueSize;

@end

@implementation HHQueue
{
    int * _arr;
    int * _q_front;
    int * _q_rear;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        _arr = malloc(sizeof(int) * MAX_COUNT);
        memset(_arr, 0, MAX_COUNT);
        _q_front = _arr;
        _q_rear = _arr - 1;
        _queueSize = 0;
    }
    return self;
}

- (BOOL)enqueue:(int)number {
    
    if (_q_rear < _arr) { // 初始化
        
        _q_rear++;
        *_q_rear = number;
        _queueSize = 1;
        return YES;
    }
    _q_rear ++;
    if (_q_rear - _arr > (MAX_COUNT - 1)) {
        
        _q_rear -= MAX_COUNT;
    }
    if (_q_rear == _q_front) return NO; // queue 溢出
    *_q_rear = number;
    _queueSize += 1;
    
    return YES;
}

- (int)dequeue {
    
    if (_queueSize <= 0) return NAN;
    
    int number = *_q_front;
    _q_front++;
    _queueSize--;
    if (_q_front - _arr > (MAX_COUNT - 1)) {
        
        _q_front -= MAX_COUNT;
    }
    return number;
}

- (void)dealloc {

    free(_arr);
}

@end
