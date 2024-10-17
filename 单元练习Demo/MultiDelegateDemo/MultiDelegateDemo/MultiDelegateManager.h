//
//  MultiDelegateManager.h
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyMultiDelegate <NSObject>

- (void)didReceiveData:(NSString *)data;

@end


@interface MultiDelegateManager : NSObject

@property (nonatomic, strong) NSHashTable *delegates;

- (void)addDelegate:(id<MyMultiDelegate>)delegate;
- (void)removeDelegate:(id<MyMultiDelegate>)delegate;
- (void)notifyDelegatesWithData:(NSString *)data;

@end

NS_ASSUME_NONNULL_END
