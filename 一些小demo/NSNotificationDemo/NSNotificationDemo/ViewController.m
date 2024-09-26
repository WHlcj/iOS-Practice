//
//  ViewController.m
//  NSNotificationDemo
//
//  Created by Changjun Li on 2024/9/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:@"MyNotification"
                                               object:nil];

    
    void (^observerBlock)(NSNotification *) = ^(NSNotification * _Nonnull note) {
        NSLog(@"Received notification.");
    };
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"MyNotification"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:observerBlock];

    observerBlock = nil;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:nil];

}

- (void)handleNotification:(NSNotification *)notification {
    NSLog(@"执行了handleNotification");
}

@end
