
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static int *rawArr;

void swap(int *a, int *b); // 交换
void _printfArr(void); // 打印过程

- (void)viewDidLoad {
    [super viewDidLoad];
    int a[15] = {10, 2, -2, 6, 5, 4, 2, 1, 9, 12, 34, 3, 98, -90, -3};
    rawArr = a;

//    [self quickSort:a length:15];
//    max_heapify(a, 0, 14);
    [self heapSort:a length:15];
    _printfArr();
}

#pragma mark - 插入排序
// 插入排序
- (void)insertionSort:(int *)array length:(int)length {
    
    if (length <= 1) return;
    [self insertionSort:array length:length - 1];
    [self insertionSort:array insert:array[length - 1] length:length - 1];
}

- (void)insertionSort:(int *)array insert:(int)insert length:(int)length {
    
    if (length < 1) return;
    int key = insert;
    for (int i = length - 1; i >= 0; i --) {
        
        if (array[i] > key) {
            
            array[i + 1] = array[i];
            array[i] = key;
        } else {
            break;
        }
    }
}

#pragma mark - 快速排序
// 快速排序
- (void)quickSort:(int *)array length:(int)length {
    
    if (length <= 1) return;
    int p = [self quickSort_partition:array length:length];
    [self quickSort:array length:p];
    [self quickSort:array+p+1 length:length-p-1];
}

- (int)quickSort_partition:(int *)array length:(int)length {
    
    if (length <= 1) return 0;
    int *pivot = array; // 选择用于分区的点
    int increment = 1;
    for (int i = 1; i < length; i ++) {
        
        if (array[i] < *pivot) { // 小于基准点的数从左顺序放置
            swap(array + increment, array + i);
            increment ++;
            
            _printfArr();
        }
    }
    swap(pivot, array + increment - 1);
    
    return increment - 1;
}

#pragma mark - 堆排序
// 堆排序
- (void)heapSort:(int *)array length:(int)length {
    
    if (length <= 1) return;
    [self heapSort_maxHeapify:array length:length]; // 构造 max Heap
    swap(&array[0], &array[length - 1]); // 取出堆顶，放入数组末尾
    _printfArr();
    [self heapSort:array length:length - 1]; // 递归求解
}

/**
 构造大端堆

 @param array 输入数组
 @param length 数组长度
 */
- (void)heapSort_maxHeapify:(int *)array length:(int)length {
    
    if (length <= 1) return;
    for (int j = 0; j <= length / 2 - 1; j ++) {
        
        for (int i = length / 2 - 1; i >= j; i --) {
            
            int dad = i;
            int son = dad * 2 + 1;
            if (son+1 < length && array[son + 1] > array[son]) {
                swap(&array[son +1], &array[son]);
            }
            if (array[son] > array[dad]) {
                swap(&array[son], &array[dad]);
            }
        }
    }
}

#pragma mark - 旋转二叉树

// single Rotation

// double Rotation



#pragma mark - private methods
 void _printfArr() {
    
    for (int i = 0; i <= 15 - 1; i ++) {
        
        printf(" %d  ", rawArr[i]);
    }
    printf("\n");
}

 void swap(int * a, int * b) {
    
     if (a == b) return;
     *a = (*a)^(*b);
     *b = (*a)^(*b);
     *a = (*a)^(*b);
}

@end
