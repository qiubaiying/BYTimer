//
//  BYTimer.m
//  Demo_定时器
//
//  Created by Jack on 16/12/16.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "BYTimer.h"

static int _timeout;

@interface BYTimer ()

@property (nonatomic, strong) HandlerBlock handlerBlock;

@property (nonatomic, strong) FinishBolck finish;


@end

@implementation BYTimer

+ (void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(FinishBolck)finish {
    [[[self alloc] init] createTimerWithTimeout:timeout handlerBlock:handlerBlock finish:finish];
}


- (void)createTimerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(FinishBolck)finish {
    
    _timeout = timeout;
    self.handlerBlock = handlerBlock;
    self.finish = finish;
    
    [self _startCountdown];
    
    
}


- (void)_startCountdown {
    
    int interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (_timeout > 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_handlerBlock) {
                    _handlerBlock(_timeout);
                }
            });
            
        } else {
            
            NSLog(@"倒计时结束");
            
            dispatch_source_cancel(timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_finish) {
                    _finish();
                }
            });
        }
        
        _timeout --;
        
    });
    
    // 开启定时器
    dispatch_resume(timer);
    
    
}

@end
