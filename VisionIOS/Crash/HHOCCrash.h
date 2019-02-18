//
//  HHOCCrash.h
//  VisionIOS
//
//  Created by shen on 2019/2/13.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHOCCrash : NSObject

+ (void)crash_unRecognizedSelector;
+ (void)crash_ArrayOutOfBound;
+ (void)crash_DanglingPointer;
+ (void)crash_DiviceByZero;

@end

NS_ASSUME_NONNULL_END
