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

#import "HHLogger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    [HHLogger start];
    
    self.window.rootViewController = [[HHReplicationLayerController alloc] init];
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
