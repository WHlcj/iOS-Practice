//
//  ViewController.m
//  CategoryDemo
//
//  Created by Changjun Li on 2024/10/4.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSObject *test;

@end

@implementation Person

- (void)sayHi {
    NSLog(@"sayHi");
}

@end

// Person 类的分类
@interface Person (SayHiCategory)

@end

@implementation Person (SayHiCategory)

- (void)sayHi {
    NSLog(@"sayHi from Category");
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    [person sayHi];
}

@end


