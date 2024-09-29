//
//  CustomThread.m
//  CustomeThreadDemo
//
//  Created by Changjun Li on 2024/9/24.
//

#import "CustomThread.h"

static NSThread *customThread = nil;

@implementation CustomThread

+ (void)threadEntryPoint {
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];  // 保证线程不会退出
    }
}

+ (NSThread *)sharedCustomThread {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        customThread = [[NSThread alloc] initWithTarget:self selector:@selector(threadEntryPoint) object:nil];
        customThread.name = @"myCustomThread";
        [customThread start];   // 启动线程，使其执行performselector方法
    });
    return customThread;
}

@end
