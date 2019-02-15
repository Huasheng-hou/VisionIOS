//
//  HHQueue.h
//  VisionIOS
//
//  Created by shen on 2019/1/11.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHQueue : NSObject

@property (atomic, assign, readonly) int queueSize;

- (BOOL)enqueue:(int)number;
- (int)dequeue;

@end

NS_ASSUME_NONNULL_END
