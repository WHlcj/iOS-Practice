//
//  ViewController.m
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/17.
//

#import "ViewController.h"
#import "MultiDelegateManager.h"
#import "ExampleClass.h"
#import "FirstDelegate.h"
#import "SecondDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FirstDelegate *firstDelegate = [[FirstDelegate alloc] init];
    SecondDelegate *secondDelegate = [[SecondDelegate alloc] init];
    
    // 添加代理
    MultiDelegateManager *manager = [[MultiDelegateManager alloc] init];
    [manager addDelegate:firstDelegate];
    [manager addDelegate:secondDelegate];

    // 发送通知
    [manager notifyDelegatesWithData:@"Hello, Delegates!"];
}


@end
