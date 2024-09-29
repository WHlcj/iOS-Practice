//
//  ViewController.m
//  blockDemo
//
//  Created by Changjun Li on 2024/9/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
    [self test2];
}

- (void)test{
    int age = 10;
    
    void (^block1)(void) = ^{
        NSLog(@"-----");
    };
    NSLog(@"NSGlobalBlock：%@",[block1 class]);
    
    NSLog(@"NSStackBlock：%@",[^{
        NSLog(@"----%d",age);
    } class]);
    
    NSLog(@"NSMallocBlock：%@",[[^{
        NSLog(@"----%d",age);
    } copy] class]);
    
    void (^block4)(void) = ^{
        NSLog(@"----%d",age);
    };
    
    NSLog(@"NSMallocBlock：%@", [block4 class]);
}

- (void)test2 {
    __block int count = 10;
    
    // 执行栈上的 Block
    NSLog(@"myBlock：%@", [^{
        count += 5;
    } class]);
    NSLog(@"Before Block execution - count: %d", count);
    ^{
        count += 5;
    }();
    NSLog(@"After Block execution - count: %d", count);
    
    // 将 Block 复制到堆上
    void (^heapBlock)(void) = [^{
        count += 5;
    } copy];
    
    // 执行堆上的 Block
    NSLog(@"heapBlock：%@", [heapBlock class]);
    NSLog(@"Before Heap Block execution - count: %d", count);
    heapBlock();
    NSLog(@"After Heap Block execution - count: %d", count);
}


@end
