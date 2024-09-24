//
//  CustomThread.h
//  CustomeThreadDemo
//
//  Created by Changjun Li on 2024/9/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomThread : UIView

+ (NSThread *)sharedCustomThread;

@end

NS_ASSUME_NONNULL_END
