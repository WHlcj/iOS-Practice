//
//  KVOObserver.m
//  KVOOptimizeDemo
//
//  Created by Changjun Li on 2024/10/17.
//

#import "NSObject+SimplifiedKVO.h"
#import "objc/runtime.h"

@implementation KVOObserver

- (instancetype)initWithCallbackBlock:(void (^)(id, NSString *, NSDictionary *))callbackBlock {
    self = [super init];
    if (self) {
        _callbackBlock = [callbackBlock copy];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context {
    if (self.callbackBlock) {
        self.callbackBlock(object, keyPath, change);
    }
}

@end


@implementation NSObject (SimplifiedKVO)

static const char *KVOObserverKey = "KVOObserverKey";

- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
           withBlock:(void (^)(id observedObject, NSString *keyPath, NSDictionary *change))block {
    
    KVOObserver *kvoObserver = [[KVOObserver alloc] initWithCallbackBlock:block];
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(kvoObserver), kvoObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addObserver:kvoObserver forKeyPath:keyPath options:options context:nil];
}

- (void)removeObserverForKeyPath:(NSString *)keyPath {
    KVOObserver *kvoObserver = objc_getAssociatedObject(self, KVOObserverKey);
    if (kvoObserver) {
        [self removeObserver:kvoObserver forKeyPath:keyPath];
        objc_setAssociatedObject(self, KVOObserverKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}
@end
