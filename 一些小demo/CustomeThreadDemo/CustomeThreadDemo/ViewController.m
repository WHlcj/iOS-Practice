//
//  ViewController.m
//  CustomeThreadDemo
//
//  Created by Changjun Li on 2024/9/24.
//

#import "ViewController.h"
#import "CustomThread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self someMethod];
}

// 使用自定义线程执行任务
- (void)someMethod {
    [self performSelector:@selector(doWork) onThread:[CustomThread sharedCustomThread] withObject:nil waitUntilDone:NO];
}

- (void)doWork {
    NSLog(@"在自定义线程上执行任务");
}

@end
