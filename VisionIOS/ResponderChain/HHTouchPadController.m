//
//  HHTouchPadController.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/11/28.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "HHTouchPadController.h"
#import "H3CFatherView.h"
#import "H3CChildView.h"

@interface HHTouchPadController ()

@end

@implementation HHTouchPadController {
    
    H3CFatherView *_fatherView;
    H3CChildView *_childView;
}

- (id)init {
 
    if (self = [super init]) {
        
        H3CFatherView *fatherView = [[H3CFatherView alloc] init];
        fatherView.backgroundColor = [UIColor blueColor];
        fatherView.center = self.view.center;
        fatherView.bounds = CGRectMake(0, 0, 250, 250);
        fatherView.userInteractionEnabled = NO;
        
        H3CChildView *childView = [[H3CChildView alloc] init];
        childView.backgroundColor = [UIColor yellowColor];
        childView.center = CGPointMake(125, 125);
        childView.bounds = CGRectMake(0, 0, 100, 100);
        
        _fatherView = fatherView;
        _childView = childView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_fatherView];
    [_fatherView addSubview:_childView];
}

- (void)viewDidLayoutSubviews {
 
    [super viewDidLayoutSubviews];
    _fatherView.center = self.view.center;
}

- (UIResponder *)nextResponder {

    return _childView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
