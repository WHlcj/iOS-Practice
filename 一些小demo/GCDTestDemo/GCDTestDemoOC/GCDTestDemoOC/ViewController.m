//
//  ViewController.m
//  GCDTestDemoOC
//
//  Created by Changjun Li on 2024/7/5.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, assign) NSInteger sum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sum = 0;
    
    // 创建和配置 ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"globe"]];
    imageView.tintColor = [UIColor systemBlueColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView.widthAnchor constraintEqualToConstant:50].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:50].active = YES;
    // 创建和配置 Label
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.sum];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    // 创建和配置 Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"+1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(incrementNumber) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    // 创建和配置 StackView
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, self.numberLabel, button]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 10;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stackView];
    // 设置 StackView 的 Auto Layout 约束
    [NSLayoutConstraint activateConstraints:@[
        [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

- (void)incrementNumber {
    self.sum += 1;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.sum];
    [self GCDTest_1];
}

// MARK: Basic
/// 向队列提交任务
- (void)GCDTest_1 {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.serial", NULL);
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.example.myconcurrent", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"start");
    dispatch_async(serialQueue, ^{
        NSLog(@"block1 start");
        sleep(3);
        NSLog(@"block1 调用线程: %@", [NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"block2 start");
        sleep(2);
        NSLog(@"block2 调用线程: %@", [NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"block3 start");
        sleep(1);
        NSLog(@"block3 调用线程: %@", [NSThread currentThread]);
    });
    // 模拟大量主线程任务
    for (int i=0;i<10000;i++) {
        i = i * i;
    }
    NSLog(@"end");
}

// MARK: Block
- (void)GCDTest_2 {
    // 创建队列
    dispatch_queue_attr_t myAttr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.example.myconcurrent", myAttr);
    // 创建一个调度块
    dispatch_block_t myBlock = dispatch_block_create(0, ^{
        NSLog(@"Block is excuting!");
        sleep(2);
        NSLog(@"Block finished");
    });
    // 提交异步任务
    dispatch_async(concurrentQueue, myBlock);
    // 取消块
    dispatch_block_cancel(myBlock);
    // 修改块
    myBlock = dispatch_block_create(0, ^{
        NSLog(@"New block is excuting!");
        sleep(2);
        NSLog(@"New block finished");
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Method end");
    });
}

// MARK: QoS
/// QoS 示例 - 向不同 QoS 队列提交任务
- (void)GCDTest_3_1 {
    // 获取不同 QoS 级别的全局并发队列
    dispatch_queue_t userInteractiveQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t userInitiatedQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t utilityQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    // 提交任务到各个队列
    dispatch_async(backgroundQueue, ^{
        NSLog(@"Background task started");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Background task finished");
    });
    dispatch_async(utilityQueue, ^{
        NSLog(@"Utility task started");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Utility task finished");
    });
    dispatch_async(userInitiatedQueue, ^{
        NSLog(@"User Initiated task started");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"User Initiated task finished");
    });
    dispatch_async(userInteractiveQueue, ^{
        NSLog(@"User Interactive task started");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"User Interactive task finished");
    });
}

/// QoS 示例 - 向同一队列提交不同 QoS 任务
- (void) GCDTest_3_2 {
    // 创建一个自定义的并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.example.myconcurrent", DISPATCH_QUEUE_CONCURRENT);
    
    // 创建并提交具有 Background QoS 的任务
    dispatch_block_t backgroundBlock = dispatch_block_create_with_qos_class(0, QOS_CLASS_BACKGROUND, 0, ^{
        NSLog(@"Background task");
    });
    dispatch_async(concurrentQueue, backgroundBlock);
    
    // 创建并提交具有 Utility QoS 的任务
    dispatch_block_t utilityBlock = dispatch_block_create_with_qos_class(0, QOS_CLASS_UTILITY, 0, ^{
        NSLog(@"Utility task");
    });
    dispatch_async(concurrentQueue, utilityBlock);
    
    // 创建并提交具有 User Initiated QoS 的任务
    dispatch_block_t userInitiatedBlock = dispatch_block_create_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0, ^{
        NSLog(@"User Initiated task");
    });
    dispatch_async(concurrentQueue, userInitiatedBlock);
    
    // 创建并提交具有 User Interactive QoS 的任务
    dispatch_block_t userInteractiveBlock = dispatch_block_create_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0, ^{
        NSLog(@"User Interactive task");
    });
    dispatch_async(concurrentQueue, userInteractiveBlock);
    
    NSLog(@"-----------------------------");
}

// MARK: Semaphore
/// 初探信号量
- (void)GCDTest_4 {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.example.concurrent", DISPATCH_QUEUE_CONCURRENT);
    // semaphore 实践示例
    dispatch_semaphore_t mysemaphore = dispatch_semaphore_create(0);
    NSLog(@"start");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), concurrentQueue, ^{
        NSLog(@"signal前");
        dispatch_semaphore_signal(mysemaphore);
    });
    NSLog(@"wait前");
    dispatch_semaphore_wait(mysemaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"end");
}

@end

// MARK: - 单例

@interface Singleton : NSObject

+(instancetype)sharedManager;

@end

@implementation Singleton

+(instancetype)sharedManager {
    static Singleton *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[self alloc] init];
            NSLog(@"Singleton instance created");
        }
    });
    return manager;
}

@end



