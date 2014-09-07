//
//  NSTimer+JMHWeak.h
//  JMHWeakTimerDemo
//
//  Created by juanmaohu on 9/7/14.
//  Copyright (c) 2014 juanmaohu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JMHBlock)();

@interface NSTimer (JMHWeak)

+ (NSTimer *)jmh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     block:(JMHBlock)block
                                   repeats:(BOOL)repeats;                                                                           
@end
