//
//  Person.m
//  CategoryDemo
//
//  Created by Changjun Li on 2024/10/21.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, strong) NSString *privateProperty;

- (void)privateMethod;

@end

@implementation Person

- (void)publicMethod {
    NSLog(@"调用了publicMethod");
    [self privateMethod];
    NSLog(@"publicMethod调用了privateMethod");
}

- (void)privateMethod {
    NSLog(@"调用了privateMethod");
}

@end
