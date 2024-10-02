//
//  ViewController.m
//  NSConditionDemo
//
//  Created by Changjun Li on 2024/10/1.
//

#import "ViewController.h"

@interface ProducerConsumer : NSObject

@property (strong, nonatomic) NSCondition *condition;
@property (strong, nonatomic) NSMutableArray *buffer;

- (void)produce;
- (void)consume;

@end

@implementation ProducerConsumer

- (instancetype)init {
    self = [super init];
    if (self) {
        _condition = [[NSCondition alloc] init];
        _buffer = [NSMutableArray array];
    }
    return self;
}

- (void)produce {
    [self.condition lock];
    
    NSLog(@"Producing item...");
    [self.buffer addObject:@"Item"];
    [self.condition signal]; // 通知等待的消费者线程
    [self.condition unlock];
}

- (void)consume {
    [self.condition lock];
    
    while (self.buffer.count == 0) {
        NSLog(@"Buffer is empty, waiting for item...");
        [self.condition wait]; // 等待条件
    }
    
    NSLog(@"Consuming item...");
    [self.buffer removeLastObject];
    
    [self.condition unlock];
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ProducerConsumer *pc = [[ProducerConsumer alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"current Thread: %@", [NSThread currentThread]);
        [pc consume];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"current Thread: %@", [NSThread currentThread]);
        [pc produce];
    });
    
    NSLog(@"----------");
    [self testConditonLock];
}

- (void)testConditonLock{
    // 设置初始值为 2
    NSConditionLock *conditionLock = [[NSConditionLock alloc] initWithCondition:2];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // 只有当条件为 1 时才会获取锁
        [conditionLock lockWhenCondition:1];
        NSLog(@"线程 1");
        [conditionLock unlockWithCondition:0]; // 更新条件为 0
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 只有当条件为 2 时才会获取锁
        [conditionLock lockWhenCondition:2];
        NSLog(@"线程 2");
        [conditionLock unlockWithCondition:1]; // 更新条件为 1
        
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 线程 3 不依赖条件值，它会等待前面线程释放锁后再执行。
        [conditionLock lock];
        NSLog(@"线程 3");
        [conditionLock unlock];
    });
}

@end
