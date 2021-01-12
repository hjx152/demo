//
//  View.m
//  newPage
//
//  Created by 金现代 on 2021/1/12.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@interface View ()
{
    UILabel *label;
    UIButton *button;
}
@end

@implementation View

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UIButton *test = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 280,40)];
    [test setTitle:@"返回" forState:UIControlStateNormal];
    [test setBackgroundColor: [UIColor lightGrayColor]];
    [test setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    [test setBackgroundColor:[UIColor blueColor]];
    
    [test setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [test addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:test];
    
    [self showToast];
}

- (void) showToast{
    NSLog(@"FQA");
    NSString *msg1 = @"欢迎用户";
    NSString *msg2 = @"登录!";
    NSString *msg = [[NSString alloc] initWithFormat:@"%@%@%@",msg1,self.userName,msg2];
    //初始化弹窗
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    //弹出提示框
    [self presentViewController:alert animated:true completion:nil];
}

- (void)back{
//    ViewController *vi = [[ViewController alloc]init];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
