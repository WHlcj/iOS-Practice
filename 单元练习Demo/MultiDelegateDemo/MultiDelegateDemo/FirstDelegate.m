//
//  FirstDelegate.m
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/22.
//

#import "FirstDelegate.h"

@implementation FirstDelegate

- (void)didReceiveData:(NSString *)data {
    NSLog(@"FirstDelegate received: %@", data);
}

@end
