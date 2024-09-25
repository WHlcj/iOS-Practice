#import "ViewController.h"
#import "objc/runtime.h"

@interface Person: NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger age;

@end

@implementation Person

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"Tried to set undefined key: %@", key);
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"Tried to access undefined key: %@", key);
    return nil;
}

- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"Tried to set nil for key: %@", key);
    if ([key isEqualToString:@"age"]) {
        self.age = 0;
    } else {
        [super setNilValueForKey:key]; // 调用父类的实现，继续抛出异常
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
    // 设置属性值
    [person setValue:@"John" forKey:@"name"];
    // 点语法设置属性值，触发setValue:forUndefinedKey:方法
    [person setValue:@"New York" forKeyPath:@"address"];
    // 获取属性值
    NSString *name = [person valueForKey:@"name"];
    // 点语法获取属性值，触发valueForUndefinedKey:方法
    NSString *city = [person valueForKeyPath:@"address"];
    // 触发setNilValueForKey:方法
    [person setValue:nil forKey:@"age"];
}

@end
