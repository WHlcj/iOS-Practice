//
//  KVOObserver.h
//  KVOOptimizeDemo
//
//  Created by Changjun Li on 2024/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOObserver : NSObject

@property (nonatomic, copy) void (^callbackBlock)(id observedObject, NSString *keyPath, NSDictionary *change);

@end

@interface NSObject (SimplifiedKVO)

- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
           withBlock:(void (^)(id observedObject, NSString *keyPath, NSDictionary *change))block;

- (void)removeObserverForKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
