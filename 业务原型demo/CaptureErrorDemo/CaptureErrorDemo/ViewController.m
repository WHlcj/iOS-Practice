//
//  ViewController.m
//  CaptureErrorDemo
//
//  Created by Changjun Li on 2024/9/24.
//

#import "ViewController.h"

void uploadCrashLog(NSString *crashInfo) {
    // 将 crashInfo 上传到你的服务器
    NSLog(@"Uploading crash log: %@", crashInfo);
}

NSString* getExceptionInfo(NSException *exception) {
    NSString *name = exception.name;
    NSString *reason = exception.reason ?: @"Unknown reason";
    NSString *userInfo = exception.userInfo ? [exception.userInfo description] : @"No additional info";
    NSString *callStack = [[exception callStackSymbols] componentsJoinedByString:@"\n"];
    
    NSString *crashLog = [NSString stringWithFormat:@"Crash Name: %@\nReason: %@\nUser Info: %@\nCall Stack: %@", name, reason, userInfo, callStack];
    return crashLog;
}

void handleException(NSException *exception) {
    NSString *crashInfo = getExceptionInfo(exception);
    uploadCrashLog(crashInfo);
}

void setupCrashHandler(void) {
    NSSetUncaughtExceptionHandler(&handleException);
}


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置全局异常处理器
    setupCrashHandler();
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"123");
    });


        // 模拟一个崩溃
        @throw [NSException exceptionWithName:@"TestException" reason:@"Testing crash" userInfo:nil];

}


@end
