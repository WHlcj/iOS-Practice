//
//  ViewController.m
//  UrlSchemeDemoOC
//
//  Created by Changjun Li on 2024/1/2.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIButton *jumpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)onClickedJumpButton {
    NSString *urlString = [NSString stringWithFormat:@"swiftDemo://?user=elee"];
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (!success) {
                self.infoLabel.text = [NSString stringWithFormat:@"跳转失败"];
            }
        }];
    } else {
        self.infoLabel.text = [NSString stringWithFormat:@"目标app不存在 or 不在白名单"];
        return;
    }
}

- (void)initUI {
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.jumpButton];
    
    
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_jumpButton.mas_top);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@150);
        make.height.equalTo(@50);
    }];
}

- (UILabel *)infoLabel {
    if (_infoLabel == nil) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.text = @"这是OCDemo";
        _infoLabel.font = [UIFont systemFontOfSize:17];
        _infoLabel.numberOfLines = 0;
        _infoLabel.textColor = [UIColor systemGrayColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return  _infoLabel;
}

- (UIButton *)jumpButton {
    if (_jumpButton == nil) {
        _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton.frame = CGRectMake(100, 100, 250, 50);
        _jumpButton.layer.cornerRadius = 15;
        [_jumpButton setTitle:@"跳转" forState:UIControlStateNormal];
        [_jumpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_jumpButton setBackgroundColor:[UIColor purpleColor]];
        [_jumpButton addTarget:self action:@selector(onClickedJumpButton) forControlEvents:UIControlEventTouchUpInside];
    
    }
    return _jumpButton;
}

@end
