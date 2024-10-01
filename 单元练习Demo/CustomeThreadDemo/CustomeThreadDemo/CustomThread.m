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
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode]; // 添加 NSMachPort 是为了防止 RunLoop 由于缺乏事件源而立刻退出，确保线程在有任务时能正常响应和处理。
        [runLoop run];
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
