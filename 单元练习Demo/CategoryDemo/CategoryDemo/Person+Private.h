//
//  Person+Private.h
//  CategoryDemo
//
//  Created by Changjun Li on 2024/10/21.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Private)

@property (nonatomic, strong) NSString *privateProperty;

- (void)privateMethod;

@end

NS_ASSUME_NONNULL_END
