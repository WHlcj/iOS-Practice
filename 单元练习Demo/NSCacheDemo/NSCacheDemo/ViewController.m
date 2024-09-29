//
//  ViewController.m
//  NSCacheDemo
//
//  Created by Changjun Li on 2024/9/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSCache *cache = [[NSCache alloc] init];
    // 设置最大缓存数量
    cache.countLimit = 3;
    
    // 向缓存中添加对象
    [cache setObject:@"Object 1" forKey:@"Key1"];
    [cache setObject:@"Object 2" forKey:@"Key2"];
    [cache setObject:@"Object 3" forKey:@"Key3"];
    
    // 从缓存中获取对象
    NSLog(@"Object for Key1: %@", [cache objectForKey:@"Key1"]);
    
    // 添加一个新的对象，超出数量限制，最早添加的对象会被移除
    [cache setObject:@"Object 4" forKey:@"Key4"];
    
    // 尝试获取已经被移除的对象
    NSLog(@"Object for Key1 (after limit reached): %@", [cache objectForKey:@"Key1"]);
    NSLog(@"Object for Key2: %@", [cache objectForKey:@"Key2"]);

    [cache setObject:@"Object 5" forKey:@"Key5"];
    
    NSLog(@"Object for Key1 (after limit reached): %@", [cache objectForKey:@"Key1"]);
    NSLog(@"Object for Key3: %@", [cache objectForKey:@"Key3"]);
}


@end
