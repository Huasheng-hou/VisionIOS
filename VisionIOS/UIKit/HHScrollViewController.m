//
//  HHScrollViewController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/1.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHScrollViewController.h"
#import "Colors.h"

@interface HHScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *zoomView;

@end

@implementation HHScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BG_COLOR;
    [self _initViews];
}

- (void)_initViews {
    
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
//    CALayer *contentLayer = [CALayer layer];
//    contentLayer.contents = (id)[UIImage imageNamed:@"917971.jpg"].CGImage;
//    contentLayer.contentsScale = [UIScreen mainScreen].scale;
//    contentLayer.frame = CGRectMake(0, 0, 1280, 720);
    
//    [_scrollView.layer addSublayer:contentLayer];
    
    [self.view addSubview:_scrollView];
}

#pragma mark - Event Response
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    CGPoint location =  [[touches anyObject] locationInView:self.view];
    NSLog(@"touches begin at:(%.1f, %.1f)", location.x, location.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint location =  [[touches anyObject] locationInView:self.view];
    NSLog(@"touches moved at:(%.1f, %.1f)", location.x, location.y);
}

#pragma mark - UIScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _zoomView;
}

@end
