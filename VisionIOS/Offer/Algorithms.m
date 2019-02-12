//
//  Algorithms.m
//  VisionIOS
//
//  Created by 华生侯 on 2018/12/6.
//  Copyright © 2018 华生侯. All rights reserved.
//

#import "Algorithms.h"

@implementation Algorithms

- (void)run {
    
    char *matrix [3] = {"abtg", "cfcs", "jdeh"};
    [self searchPath:matrix rows:4 columns:3 str:"bfce"];
}

#pragma mark - 回溯法（矩阵中的路径）
- (void)searchPath:(char **)matrix rows:(int)rows columns:(int)columns str:(char *)str {
    
    if (rows <= 0 || columns <= 0) return;
    
    bool * visited = calloc(rows * columns, sizeof(bool));
    for (int i = 0; i < rows; i ++) {
        for (int j = 0; j < columns; j ++) {
            
            if ([self searchPath_Recursively:matrix rows:rows columns:columns r:i c:j str:str position:0 visited:visited]) {
                
            }
        }
    }
}

- (BOOL)searchPath_Recursively:(char **)matrix rows:(int)rows columns:(int)columns
                             r:(int)r c:(int)c str:(const char *)str position:(int)position
                       visited:(bool *)visited {
    
    if (r > rows - 1 || c > columns - 1) return NO;
    if (![self searchPath_Recursively:matrix rows:rows columns:columns r:r c:c - 1
                                  str:str position:position + 1 visited:visited]) {
        return NO;
    }
    if (![self searchPath_Recursively:matrix rows:rows columns:columns r:r c:c + 1
                                  str:str position:position + 1 visited:visited]) {
        return NO;
    }
    if (![self searchPath_Recursively:matrix rows:rows columns:columns r:r - 1 c:c
                                  str:str position:position + 1 visited:visited]) {
        return NO;
    }
    if (![self searchPath_Recursively:matrix rows:rows columns:columns r:r + 1 c:c
                                  str:str position:position + 1 visited:visited]) {
        return NO;
    }
    
    return NO;
}

@end
