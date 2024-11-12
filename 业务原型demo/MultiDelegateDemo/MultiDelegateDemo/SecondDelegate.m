//
//  SecondDelegate.m
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/22.
//

#import "SecondDelegate.h"

@implementation SecondDelegate

- (void)didReceiveData:(NSString *)data {
    NSLog(@"SecondDelegate received: %@", data);
}

@end
