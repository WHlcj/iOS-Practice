//
//  ViewController.m
//  CategoryDemo
//
//  Created by Changjun Li on 2024/10/21.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Private.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *person = [[Person alloc] init];
    [person privateMethod];
    [person publicMethod];
}


@end
