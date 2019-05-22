//
//  main.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/21.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "fishhook.h"
#import "HHArcObject.h"

static id (*origin_objc_autoreleaseReturnValue)(id obj);
id my_objc_autoreleaseReturnValue (id obj) {
    
//    printf("fucked\n");
    return origin_objc_autoreleaseReturnValue(obj);
//    return my_objc_autoreleaseReturnValue(obj);
}

static int (*original_open)(const char *, int, ...);

int new_open(const char *path, int oflag, ...) {
    va_list ap = {0};
    mode_t mode = 0;
    
    if ((oflag & O_CREAT) != 0) {
        // mode only applies to O_CREAT
        va_start(ap, oflag);
        mode = va_arg(ap, int);
        va_end(ap);
        printf("Calling real open('%s', %d, %d)\n", path, oflag, mode);
        return original_open(path, oflag, mode);
    } else {
        printf("Calling real open('%s', %d)\n", path, oflag);
        return original_open(path, oflag, mode);
    }
}

int main(int argc, char * argv[]) {
    
    // 初始化一个 rebinding 结构体
//    struct rebinding open_rebinding = { "open", new_open, (void *)&original_open };
    
    // 将结构体包装成数组，并传入数组的大小，对原符号 open 进行重绑定
//    rebind_symbols((struct rebinding[1]){open_rebinding}, 1);
    
    // 调用 open 函数
//    __unused int fd = open(argv[0], O_RDONLY);
    @autoreleasepool {
        
        @autoreleasepool {
            HHArcObject *arc = [HHArcObject arcObject];
        }
//        rebind_symbols((struct rebinding[1]){"objc_autoreleaseReturnValue",
//            my_objc_autoreleaseReturnValue, (void *)&origin_objc_autoreleaseReturnValue}, 1);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
