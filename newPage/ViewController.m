//
//  ViewController.m
//  newPage
//
//  Created by 金现代 on 2021/1/12.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()
{
    UILabel *label;
    UILabel *name;
    UILabel *pwd;
    UIButton *button;
}

@property(strong,nonatomic) UITextField *userText;
@property(strong,nonatomic) UITextField *pwdText;

// 弹窗按钮
@property (strong, nonatomic) UIAlertAction *okBtn;
@property (strong, nonatomic) UIAlertAction *cancelBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSArray *array= [NSArray arrayWithObjects:@"tom", @"jack",@"java",nil];

    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0,33, 420, 50)];
    label.text = @"标题";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = UITextAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:label];
    
    // 用户名输入框
    self.userText=[[UITextField alloc] initWithFrame:CGRectMake(120, 100, 260, 50)];
    
    self.userText.borderStyle = UITextBorderStyleRoundedRect;
    
    self.userText.keyboardType = UIKeyboardTypeDefault;
    self.userText.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    self.userText.delegate = self;
    
    self.userText.tintColor=[UIColor redColor];
    self.userText.placeholder = @"用户名";
    
    [self.view addSubview:self.userText];
    
    // 密码输入框
    self.pwdText=[[UITextField alloc] initWithFrame:CGRectMake(120, 180, 260, 50)];
    
    self.pwdText.borderStyle = UITextBorderStyleRoundedRect;
    
    self.pwdText.keyboardType = UIKeyboardTypeDefault;
    
    self.pwdText.delegate = self;
    
    self.pwdText.tintColor=[UIColor redColor];
    self.pwdText.placeholder = @"password";
    self.pwdText.secureTextEntry = YES;
    
    [self.view addSubview:self.pwdText];
    
    // 按钮
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setBackgroundColor: [UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button setFrame:CGRectMake(90, 260, 200, 40)];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted=YES;
    button.adjustsImageWhenHighlighted =YES;
    
    [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    name = [[UILabel alloc]initWithFrame:CGRectMake(20, 85, 80, 80)];
    name.text = @"用户名：";
    name.textColor = [UIColor blueColor];
    name.numberOfLines = 0;
    name.backgroundColor = [UIColor clearColor];
    [self.view addSubview:name];

    pwd = [[UILabel alloc]initWithFrame:CGRectMake(20, 165, 80, 80)];
    pwd.text = @"密 码：";
    pwd.textColor = [UIColor blueColor];
    pwd.numberOfLines = 0;
    pwd.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pwd];
    
}

- (void)login:(UIButton *)button{
//    int userName = 1;
//    int pwd = 1;
    if ([self.userText.text isEqualToString:@"admin"] && [self.pwdText.text isEqualToString:@"admin"]) {
        [self showToast2:@"对了"];
        NSLog(@"对了");
    } else {
        [self showToast2:@"错了"];
        NSLog(@"错了");
    }
    NSLog(@"SF");
}

// 普通弹窗
- (void)showToast:(NSString *) msg {
    //初始化弹窗
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    //弹出提示框
    [self presentViewController:alert animated:true completion:nil];
}

// 带取消按钮弹窗
- (void) showToast2:(NSString *) msg {
    View *view = [[View alloc]init];
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    // 确定按钮监听
    _okBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        if ([msg isEqualToString:@"对了"]) {
            view.userName = self.userText.text;
            [self.navigationController pushViewController:view animated:YES];
        } else {
            [self showToast:@"用户名或密码错误"];
        }
        
        NSLog(@"点击了确定按钮");
    }];
    _cancelBtn =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"点击了取消按钮");
    }];
    //添加按钮到弹出上
    [alert addAction:_okBtn];
    [alert addAction:_cancelBtn];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

@end
