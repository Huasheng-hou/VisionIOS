//
//  ViewController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/21.
//  Copyright © 2018 华生侯. All rights reserved.
//

//#import "ViewController.h"
//
//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//static int *rawArr;
//
//void swap(int *a, int *b); // 交换
//void _printfArr(void); // 打印过程
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    int a[15] = {10, 2, -2, 6, 5, 4, 2, 1, 9, 12, 34, 3, 98, -90, -3};
//    rawArr = a;
//
//    _printfArr();
////    [self quickSort:a length:15];
////    max_heapify(a, 0, 14);
//    [self heapSort:a length:15];
//}
//
//#pragma mark - 插入排序
//// 插入排序
//- (void)insertionSort:(int *)array length:(int)length {
//    
//    if (length <= 1) return;
//    [self insertionSort:array length:length - 1];
//    [self insertionSort:array insert:array[length - 1] length:length - 1];
//}
//
//- (void)insertionSort:(int *)array insert:(int)insert length:(int)length {
//    
//    if (length < 1) return;
//    int key = insert;
//    for (int i = length - 1; i >= 0; i --) {
//        
//        if (array[i] > key) {
//            
//            array[i + 1] = array[i];
//            array[i] = key;
//        } else {
//            break;
//        }
//    }
//}
//
//#pragma mark - 快速排序
//// 快速排序
//- (void)quickSort:(int *)array length:(int)length {
//    
//    if (length <= 1) return;
//    int p = [self quickSort_partition:array length:length];
//    [self quickSort:array length:p];
//    [self quickSort:array+p+1 length:length-p-1];
//}
//
//- (int)quickSort_partition:(int *)array length:(int)length {
//    
//    if (length <= 1) return 0;
//    int pivot = array[0];
//    int increment = 1;
//    for (int i = 1; i < length; i ++) {
//        
//        if (array[i] < pivot) {
//            int tmp = array[increment];
//            array[increment] = array[i];
//            array[i] = tmp;
//            increment ++;
//            
//            _printfArr();
//        }
//    }
//    array[0] = array[increment - 1];
//    array[increment - 1] = pivot;
//    
//    return increment - 1;
//}
//
//#pragma mark - 堆排序
//// 堆排序
//- (void)heapSort:(int *)array length:(int)length {
//    
//    _printfArr();
//    if (length <= 1) return;
//    [self heapSort_maxHeapify:array length:length];
//    swap(&array[0], &array[length - 1]);
//    [self heapSort:array length:length - 1];
//}
//
//- (void)heapSort_maxHeapify:(int *)array length:(int)length {
//    
//    if (length <= 1) return;
//    for (int j = 0; j <= length / 2 - 1; j ++) {
//        
//        for (int i = length / 2 - 1; i >= j; i --) {
//            
//            int dad = i;
//            int son = dad * 2 + 1;
//            if (son+1 < length && array[son + 1] > array[son]) {
//                swap(&array[son +1], &array[son]);
//            }
//            if (array[son] > array[dad]) {
//                swap(&array[son], &array[dad]);
//            }
//        }
//    }
//}
//
//void max_heapify(int arr[], int start, int end) {
//    //建立父節點指標和子節點指標
//    int dad = start;
//    int son = dad * 2 + 1;
//    while (son <= end) { //若子節點指標在範圍內才做比較
//        
//        _printfArr();
//        if (son + 1 <= end && arr[son] < arr[son + 1]) //先比較兩個子節點大小，選擇最大的
//            son++;
//        if (arr[dad] > arr[son]) //如果父節點大於子節點代表調整完畢，直接跳出函數
//            return;
//        else { //否則交換父子內容再繼續子節點和孫節點比較
////            swap(arr[dad], arr[son]);
//            dad = son;
//            son = dad * 2 + 1;
//        }
//    }
//    _printfArr();
//}
//
//#pragma mark - private methods
// void _printfArr() {
//    
//    for (int i = 0; i <= 15 - 1; i ++) {
//        
//        printf(" %d  ", rawArr[i]);
//    }
//    printf("\n");
//}
//
// void swap(int * a, int * b) {
//    
//     int tmp = *b;
//     *b = *a;
//     *a = tmp;
//}
//
//@end
