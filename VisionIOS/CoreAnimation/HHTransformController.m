//
//  HHTransformController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/1.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHTransformController.h"
#import "Colors.h"

@interface HHTransformController ()

@property (nonatomic, strong) CALayer *transformLayer;

@end

@implementation HHTransformController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BG_COLOR;
    
    [self _initViws];
//    [self _rotate];
//    [self _rotateAlongY];
    
    _transformLayer.anchorPoint = CGPointMake(0, 0);
}

- (void)_initViws {
    
    self.transformLayer = [CALayer layer];
    _transformLayer.contents = (id)[UIImage imageNamed:@"arthur.jpg"].CGImage;
    _transformLayer.contentsScale = [UIScreen mainScreen].scale;
    _transformLayer.position = self.view.center;
    _transformLayer.bounds = CGRectMake(0, 0, 300, 300);
    
    [self.view.layer addSublayer:_transformLayer];
}

- (void)_rotate {
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformRotate(transform, M_PI / 3.);
    
    _transformLayer.affineTransform = transform;
}

- (void)_rotateAlongY {
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI / 4, 0, 1, 0);
    
    _transformLayer.transform = transform;
//    NSLog(@"affine ")
}

@end
