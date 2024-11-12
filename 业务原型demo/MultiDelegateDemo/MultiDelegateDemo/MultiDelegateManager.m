//
//  MultiDelegateManager.m
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/17.
//
#import "MultiDelegateManager.h"

@implementation MultiDelegateManager

- (instancetype)init {
    if (self = [super init]) {
        // 使用 weakObjects 来避免强引用
        _delegates = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (void)addDelegate:(id<MyMultiDelegate>)delegate {
    [_delegates addObject:delegate];
}

- (void)removeDelegate:(id<MyMultiDelegate>)delegate {
    [_delegates removeObject:delegate];
}

- (void)notifyDelegatesWithData:(NSString *)data {
    for (id<MyMultiDelegate> delegate in _delegates) {
        if ([delegate respondsToSelector:@selector(didReceiveData:)]) {
            [delegate didReceiveData:data];
        }
    }
}

@end
