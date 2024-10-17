//
//  ViewController.m
//  KVOOptimizeDemo
//
//  Created by Changjun Li on 2024/10/17.
//

#import "ViewController.h"
#import "NSObject+SimplifiedKVO.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *person = [[Person alloc] init];

    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld withBlock:^(id observedObject, NSString *keyPath, NSDictionary *change) {
        NSLog(@"观察到 %@ 的 %@ 属性变化: %@", observedObject, keyPath, change);
    }];
    
    // 触发KVO
    person.name = @"New Name";
    // 移除观察者
    [person removeObserverForKeyPath:@"name"];
}


@end
