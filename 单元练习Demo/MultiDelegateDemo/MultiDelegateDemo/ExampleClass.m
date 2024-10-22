//
//  ExampleClass.m
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/22.
//

#import "ExampleClass.h"

@implementation ExampleClass

- (void)sendData {
    [self.multicastDelegate notifyDelegatesWithData:@"Hello, Delegates!"];
}

@end
