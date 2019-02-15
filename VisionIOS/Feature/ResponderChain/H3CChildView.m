//
//  H3CChildView.m
//  H3CMagic
//
//  Created by shen on 2018/12/21.
//  Copyright © 2018 H3C. All rights reserved.
//

#import "H3CChildView.h"

@implementation H3CChildView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"child get touched!");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    NSLog(@"touch point at:(%.1f, %.1f)", [touch locationInView:self].x,
          [touch locationInView:self].y);
    NSLog(@"child touch moved!");
}

@end

