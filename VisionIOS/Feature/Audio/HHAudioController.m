//
//  HHAudioController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/2.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHAudioController.h"
#import <AVFoundation/AVFoundation.h>

@interface HHAudioController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioSession *session;
@property (nonatomic, strong) AVAudioEngine *audioEngine;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation HHAudioController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.session = [AVAudioSession sharedInstance];
//    self.audioEngine = [[AVAudioEngine alloc] ]
    
    NSError *error;
    NSData *data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"calorie" ofType:@"mp3"]];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithData:data error:&error];
    player.delegate = self;
    
//    [player prepareToPlay];
    
    self.player = player;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
//    [self.player play];
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

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    
}


@end
