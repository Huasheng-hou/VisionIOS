//
//  HHScrollViewController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/1.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHScrollViewController.h"
#import "Colors.h"
#import "YYFPSLabel.h"

@interface HHScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *zoomView;

@end

@implementation HHScrollViewController
{
    CFTimeInterval _lastTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BG_COLOR;
    [self _initViews];
}

- (void)_initViews {
    
    YYFPSLabel *fpsLabel = [[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 80, 120, 30)];
    [self.view addSubview:fpsLabel];
    
    self.scrollView = [[UIScrollView alloc] init];
    _scrollView.center = self.view.center;
    _scrollView.bounds = CGRectMake(0, 0, 300, 400);
    _scrollView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(1280, 720);
    _scrollView.maximumZoomScale = 2.f;
    _scrollView.multipleTouchEnabled = YES;
    
//    _scrollView.layer.contents = (id)[UIImage imageNamed:@"917971.jpg"].CGImage;
//    _scrollView.layer.contentsScale = [UIScreen mainScreen].scale;
//    _scrollView.maximumZoomScale = 2;
    self.zoomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1280, 720)];
    
    _zoomView.layer.contents = (id)[UIImage imageNamed:@"917971.jpg"].CGImage;
    _zoomView.layer.contentsScale = [UIScreen mainScreen].scale;
    
    [_scrollView addSubview:_zoomView];
    for (int i = 0 ; i < 100; i ++) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:i / 255. green:100. blue:i / 255. alpha:0.3];
        view.center = CGPointMake(100 + i, 100 + i);
        view.bounds = CGRectMake(0, 0, 100, 100);
        view.layer.shadowColor = [UIColor yellowColor].CGColor;
        view.layer.shadowRadius = 2;
        view.layer.shadowOpacity = .7;
        
        [_scrollView addSubview:view];
    }
    
//    CALayer *contentLayer = [CALayer layer];
//    contentLayer.contents = (id)[UIImage imageNamed:@"917971.jpg"].CGImage;
//    contentLayer.contentsScale = [UIScreen mainScreen].scale;
//    contentLayer.frame = CGRectMake(0, 0, 1280, 720);
    
//    [_scrollView.layer addSublayer:contentLayer];
    
    [self.view addSubview:_scrollView];
    
//    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refreshAt)];
//    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)refreshAt {
    
    double count = (CFAbsoluteTimeGetCurrent() - _lastTime) * 60;
    _lastTime = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"this time the count is:%.1f", count);
//    NSLog(@"current time:%.2f", CFAbsoluteTimeGetCurrent());
}

#pragma mark - Event Response
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
//    CGPoint location =  [[touches anyObject] locationInView:self.view];
//    NSLog(@"touches begin at:(%.1f, %.1f)", location.x, location.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    CGPoint location =  [[touches anyObject] locationInView:self.view];
//    NSLog(@"touches moved at:(%.1f, %.1f)", location.x, location.y);
}

#pragma mark - UIScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _zoomView;
}

@end
