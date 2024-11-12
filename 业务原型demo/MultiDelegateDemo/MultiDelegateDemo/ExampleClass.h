//
//  ExampleClass.h
//  MultiDelegateDemo
//
//  Created by Changjun Li on 2024/10/22.
//

#import <Foundation/Foundation.h>
#import "MultiDelegateManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleClass : NSObject

@property (nonatomic, strong) MultiDelegateManager *multicastDelegate;

- (void)sendData;

@end

NS_ASSUME_NONNULL_END
