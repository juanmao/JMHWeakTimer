//
//  NSTimer+JMHWeak.m
//  JMHWeakTimerDemo
//
//  Created by juanmaohu on 9/7/14.
//  Copyright (c) 2014 juanmaohu. All rights reserved.
//

#import "NSTimer+JMHWeak.h"

@implementation NSTimer (JMHWeak)

+ (NSTimer *)jmh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(JMHBlock)block
                                        repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(jmh_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)jmh_blockInvoke:(NSTimer *)timer
{
    JMHBlock block = timer.userInfo;
    if (block) {
        block();
    }
}

@end
