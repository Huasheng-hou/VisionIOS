//
//  HHAudioController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/2.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHAudioController.h"
#import <AVFoundation/AVFoundation.h>

@interface HHAudioController ()

@end

@implementation HHAudioController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)_initViews {
    
}

- (void)_initAudionSession {
    
    NSError *errorSession = nil;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&errorSession];
    
}

- (NSString *)filePath {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"voice.caf"];
    
    return filePath;
}

- (void)record {
    
}

- (void)save {
    
}

@end
