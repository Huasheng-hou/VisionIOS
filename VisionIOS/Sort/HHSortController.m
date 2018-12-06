//
//  HHSortController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/5.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHSortController.h"

@interface HHSortController ()

@end

@implementation HHSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    int a[13] = {1, 3, 10, 9, 8, 5, 11, 8, 2, 0, -1, 8, 7};
    [self mergeSort:a length:13];
    for (int i = 0; i < 13; i++) {
        printf("number is:%d\n", a[i]);
    }
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

@end

