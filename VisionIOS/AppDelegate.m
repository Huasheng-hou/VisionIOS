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

#import "HHSignalHandler.h"
#import "HHExceptionHandler.h"
#import "HHMachExceptionHandler.h"
#import "HHLogger.h"
#import "HHArcObject.h"

void _objc_autoreleasePoolPrint(void);

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
//    [HHSignalHandler install];
//    InstallUncaughtExceptionHandler();
    self.window.rootViewController = [[HHReplicationLayerController alloc] init];
    
//    [HHMachExceptionHandler createAndSetExceptionPort];
//    [HHOCCrash crash_DiviceByZero];
    __weak NSString *_str;
    for (int i = 0; i < 1; i ++) {
        
        NSString *str = [NSString stringWithFormat:@"my humble string is:%d", i];
        _str = str;
//        [NSNumber numberWithChar:[str stringByAppendingString:@"tt"].UTF8String];
        [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @9, nil];
        HHArcObject *obj = [HHArcObject arcObject];
        NSLog(@"fuck!");
    }
    
    _objc_autoreleasePoolPrint();
    
//    [self addObserver];
    
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
