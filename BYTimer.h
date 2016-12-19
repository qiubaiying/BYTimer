//
//  BYTimer.h
//  Demo_定时器
//
//  Created by Jack on 16/12/16.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HandlerBlock)();

@interface BYTimer : NSObject

/**
 CDG循环定时器，回调间隔1s

 @param timeout 定时时间
 @param handlerBlock 每隔时间回调
 @param finish 定时结束回调
 */
+ (void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(HandlerBlock)finish;

/**
 创建一个CDG循环定时器
 
 @param timeout 时间间隔
 @param handlerBlock 每秒回调
 @param finish 定时结束回调
 */
- (void)createTimerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(HandlerBlock)finish;



@end
