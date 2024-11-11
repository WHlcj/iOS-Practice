//
//  AClass&BClass.m
//  load&initialize
//
//  Created by Changjun Li on 2024/11/11.
//

#import "AClass&BClass.h"


@implementation A
+ (void)load {
    NSLog(@"A +load");
}
@end


@interface A (CategoryA2)
@end

@implementation A (CategoryA2)
+ (void)load {
    NSLog(@"A (CategoryA2) +load");
}
@end

@interface A (CategoryA1)
@end

@implementation A (CategoryA1)
+ (void)load {
    NSLog(@"A (CategoryA1) +load");
}
@end


@implementation B
+ (void)load {
    NSLog(@"B +load");
}
@end

// B类的分类 CategoryB
@interface B (CategoryB)
@end

@implementation B (CategoryB)
+ (void)load {
    NSLog(@"B (CategoryB) +load");
}
@end
