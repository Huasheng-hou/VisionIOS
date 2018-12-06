//
//  HHCoreAnimationController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/28.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHCoreAnimationController.h"

@interface HHCoreAnimationController ()

@property (nonatomic, strong) CAGradientLayer *animationLayer;

@end

@implementation HHCoreAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationLayer = [CAGradientLayer layer];
//    self.animationLayer.backgroundColor = [UIColor purpleColor].CGColor;
    self.animationLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor,
                                   (__bridge id)[UIColor redColor].CGColor];
    self.animationLayer.frame = CGRectMake(100, 250, 150, 150);
    
    [self.view.layer addSublayer:self.animationLayer];
    
    [self addMask];
//    [self animate];
}

- (void)animate {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    animation.duration = 20;
    animation.repeatCount = 100;
    
    [_animationLayer addAnimation:animation forKey:nil];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(logLayers)];
    
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)addMask {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(140, 130)];
    [path addLineToPoint:CGPointMake(0, 120)];
//    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
//    mask.frame = self.animationLayer.bounds;
    mask.strokeColor = [UIColor greenColor].CGColor;
    
//    [self.animationLayer addSublayer:mask];
    self.animationLayer.mask = mask;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(30, 30)];
    animation.duration = 20;
    animation.repeatCount = 100;
    
    [mask addAnimation:animation forKey:nil];
}

- (void)logLayers {
    
    NSLog(@"time:%.1fs", CFAbsoluteTimeGetCurrent());
    NSLog(@"model layer frame:(%f, %f)", self.animationLayer.position.x, _animationLayer.position.y);
    NSLog(@"presentation layer frame:(%f, %f)", self.animationLayer.presentationLayer.position.x,
          self.animationLayer.presentationLayer.position.y);
}

@end
