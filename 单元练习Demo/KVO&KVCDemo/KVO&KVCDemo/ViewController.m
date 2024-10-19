#import "ViewController.h"

@interface Person : NSObject {
@public
    NSString *_name;
}

@end

@implementation Person
@end

// KVO监听的类
@interface Observer : NSObject
@end

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"Observed change for name: %@", change[NSKeyValueChangeNewKey]);
    }
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    Observer *observer = [[Observer alloc] init];

    // 添加KVO
    [person addObserver:observer forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    // 通过KVC修改实例变量（会自动触发KVO）
    [person setValue:@"Bob" forKey:@"name"];
    
    // 手动修改实例变量（不会自动触发KVO）
    person->_name = @"Alice";
    
    // 移除观察者
    [person removeObserver:observer forKeyPath:@"name"];
    
    // 移除后再修改
    [person setValue:@"Elee" forKey:@"name"];
    
    NSLog(@"结束");
}


@end


