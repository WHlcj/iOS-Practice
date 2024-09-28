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
    __block int count = 10;
    // 定义一个栈上的 Block
    void (^myBlock)(void) = ^{
        // Block 内访问和修改 __block 变量
        NSLog(@"Inside Block - Before: %d", count);
        count += 5;
        NSLog(@"Inside Block - After: %d", count);
    };
    
    // 执行栈上的 Block
    NSLog(@"Before Block execution - count: %d", count);
    myBlock();
    NSLog(@"After Block execution - count: %d", count);
    
    // 将 Block 复制到堆上
    void (^heapBlock)(void) = [myBlock copy];
    
    // 执行堆上的 Block
    NSLog(@"Before Heap Block execution - count: %d", count);
    heapBlock();
    NSLog(@"After Heap Block execution - count: %d", count);
}


@end
