//
//  HHReplicationLayerController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/28.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHReplicationLayerController.h"

@interface HHReplicationLayerController ()

@property (nonatomic, strong) CAReplicatorLayer *layer;

@end

@implementation HHReplicationLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:.98 green:.98 blue:.98 alpha:1];
    self.layer = [CAReplicatorLayer layer];
//    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.layer.frame = CGRectMake(150, 250, 100, 100);
    self.layer.instanceCount = 4;
    self.layer.instanceBlueOffset = -0.1;
    self.layer.instanceRedOffset = -.05;
//

    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 100, 0);
    transform = CATransform3DRotate(transform, M_PI / 3., 0, 0, 1);

    self.layer.instanceTransform = transform;
    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = self.layer.bounds;
    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:subLayer];
    
    [self.view.layer addSublayer:self.layer];
}

@end
