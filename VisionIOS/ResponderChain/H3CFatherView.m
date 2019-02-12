//
//  H3CFatherView.m
//  H3CMagic
//
//  Created by shen on 2018/12/21.
//  Copyright © 2018 H3C. All rights reserved.
//

#import "H3CFatherView.h"

@implementation H3CFatherView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"father get touched!");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"father touch moved!");
}

@end
