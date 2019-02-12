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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [self.window makeKeyAndVisible];
//    self.window.rootViewController = [[HHTouchPadController alloc] init];
//    self.window.rootViewController = [[HHAudioController alloc] init];
//    self.window.rootViewController = [[HHGcdController alloc] init];
    
//    [self addObserver];
    self.window.rootViewController = [[HHSortController alloc] init];
//    self.window.rootViewController = [[HHTransformController alloc] init];
//    self.window.rootViewController = [[HHReplicationLayerController alloc] init];
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
