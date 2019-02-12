//
//  AppDelegate.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/21.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HHCoreAnimationController.h"
#import "HHReplicationLayerController.h"
#import "HHTransformController.h"
#import "HHScrollViewController.h"
#import "UIApplication+RunLoop.h"
#import "HHGcdController.h"
#import "HHSortController.h"
#import "HHAudioController.h"
#import "HHTouchPadController.h"

#import "pthread.h"
#import "semaphore.h"
#import "signal.h"
#import "HHSignalHandler.h"
#import "HHLogger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

sem_t *sem;

void *operate(void *param) {
//    NSString *str = (__bridge NSString *)(param);
    // 用循环模拟耗时操作
//    for (int i = 0; i < 100000; i++) {
//        // [NSThread currentThread] 为获取当前
//        NSLog(@"timeConsuming in %@, times: %d, param: %@", [NSThread currentThread], i, str);
//    }
    sem_wait(sem);
    NSLog(@"first thread try!\n");
    sleep(5);
    NSLog(@"first thread post!\n");
    sem_post(sem);
    pthread_exit((void*)0);
}

void *secondPthread(void *param) {
    //    NSString *str = (__bridge NSString *)(param);
    // 用循环模拟耗时操作
    //    for (int i = 0; i < 100000; i++) {
    //        // [NSThread currentThread] 为获取当前
    //        NSLog(@"timeConsuming in %@, times: %d, param: %@", [NSThread currentThread], i, str);
    //    }
    sem_wait(sem);
    NSLog(@"second thread waked!\n");
    sleep(5);
    sem_post(sem);
    pthread_exit((void*)0);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [self.window makeKeyAndVisible];
//    self.window.rootViewController = [[HHTouchPadController alloc] init];
//    self.window.rootViewController = [[HHAudioController alloc] init];
//    self.window.rootViewController = [[HHAudioController alloc] init];
    
    pthread_t thread1;
    pthread_t thread2;
    
//    sem = sem_open("/test", O_CREAT, O_RDWR, 1);
    sem = sem_open("name_sem", O_CREAT|O_RDWR, 0666, 1);
    
    pthread_create(&thread1, NULL, operate, NULL);
    pthread_create(&thread2, NULL, secondPthread, NULL);

//    NSArray *symbols = [NSArray array];
//    [HHLogger saveToFile:symbols];
    [HHSignalHandler install];
//    NSString *path = NSHomeDirectory();
    NSArray *arr = @[@""];
    arr[10];
//    for (int i = 0; i < 500; i ++) {
//
//        pthread_t pthread;
//        pthread_create(&pthread, NULL, operate, NULL);
//    }
//    self.window.rootViewController = [[HHScrollViewController alloc] init];
//    self.window.rootViewController = [[HHGcdController alloc] init];
    
//    [self addObserver];
//    self.window.rootViewController = [[HHSortController alloc] init];
//    self.window.rootViewController = [[HHTransformController alloc] init];
    self.window.rootViewController = [[HHReplicationLayerController alloc] init];
//    self.window.rootViewController = [[HHCoreAnimationController alloc] init];
//    self.window.rootViewController = [[UINavigationController alloc]
//                                        initWithRootViewController:[[ViewController alloc] init]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
