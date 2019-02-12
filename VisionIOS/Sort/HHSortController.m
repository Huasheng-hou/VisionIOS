//
//  HHSortController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/5.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHSortController.h"
#import "HHQueue.h"
#import "HHStack.h"

@interface HHSortController ()

@end

@implementation HHSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    HHQueue *queue = [[HHQueue alloc] init];
    HHStack *stack = [[HHStack alloc] init];
    int a[35] = {1, 3, 10, 9, 8, 5, 11, 8,  2, 0,
                -1, 8, 7,  2, 2, 3, 9,  16, 5, 0,
                21, 3, 7,  4, 4, 3, 2,  4, 12, 98,
                2, 3, 4, 5, 6
    };
//    [self mergeSort:a length:13];
    for (int i = 0; i < 35; i++) {
//        printf("number is:%d\n", a[i]);
//        [queue enqueue:a[i]];
        [stack push:a[i]];
    }
    
    for (int i = 0; i < 35; i++) {
        
        printf("poped number is:%d, stack size:%d\n", [stack pop], stack.stackSize);
//        printf("dequeue number is:%d, queue size:%d\n", [queue dequeue], queue.queueSize);
    }
    
//    float grid = [self divideRectangle:160 width:110];
//    printf("grid is:%.5f\n", grid);
    
//    for (int i = 0; i < 100; i ++) {
//
//        for (int exponent = -10; exponent < 11; exponent ++) {
//
//            printf("base is:%.d\n", i);
//            printf("exponent is:%.d\n", exponent);
//
//            double result = [self power:i / 1.f exponent:exponent];
//            double libResult = pow(i / 1.f, exponent / 1.f);
//
//            printf("user result is:%.1f\n", result);
//            printf("user result is:%.1f\n", libResult);
//        }
//    }
}

#pragma mark - sort algorithms
// merge sort
- (void)mergeSort:(int *)array length:(int)length {
    
    [self mergeSort:array start:0 end:length - 1];
}

- (void)mergeSort:(int *)array start:(int)start end:(int)end {
    
    if (array == NULL || start < 0 || end <= start) {
        
        return;
    }
    
    int mid = (end - start) / 2 + start;
    
    [self mergeSort:array start:start end:mid];
    [self mergeSort:array start:mid + 1 end:end];
    [self merge:array left:start mid:mid right:end];
}

// mid 为左序列最后一个
- (void)merge:(int *)array left:(int)left mid:(int)mid right:(int)right {

    int *auxillarray = (int *)malloc(sizeof(int) * (right-left+1));
    
    int position = 0;
    int i = left, j = mid + 1;
    
    while (i <= mid || j <= right) {
        
        if (j <= right && (array[j] <= array[i] || i > mid)) { // 先从第二个序列中取
            
            auxillarray[position] = array[j];
            j++;
        } else if (i <= mid) { // 再从第一个序列中取
            
            auxillarray[position] = array[i];
            i++;
        }
        position ++;
    }
    
    for (int k = left; k <= right; k++) {
        
        array[k] = auxillarray[k - left];
    }
    free(auxillarray);
}

// quick sort
- (void)quickSort:(int *)array length:(int)length {
    
    
}

- (int)quickSort_Partition:(int *)array {
    
    return 0;
}

#pragma mark - Recursive Algorithms
// divide a rectangle
- (float)divideRectangle:(float)length width:(float)width {
    
    if (length <=0 || width <= 0) return 0;
    if (length < width) return 0;
    
    float minus = length - width;
    printf("minus is:%.5f\n", minus);
    
    if (minus == 0) {
        
        return width;
    } else {
        
        if (width > minus) {
            
            return [self divideRectangle:width width:minus];
        } else {
            return [self divideRectangle:minus width:width];
        }
    }
        
    return 0;
}

- (double)power:(double)base exponent:(int)exponent {
    
//    if () return 0;
//    if (exponent == 0)
    return 0;
}

- (double)powerWithUnsignedExponent:(double)base exponent:(unsigned int)exponent {
    
    return 0;
}

@end

