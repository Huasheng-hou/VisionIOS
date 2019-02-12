//
//  HHLogger.h
//  VisionIOS
//
//  Created by 华生侯 on 2019/2/3.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHLogger : NSObject

+ (void)start;
+ (void)suspend;
+ (void)stop;

+ (void)saveToFile:(id)object;

@end

NS_ASSUME_NONNULL_END
