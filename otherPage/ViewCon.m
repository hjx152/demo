//
//  ViewCon.m
//  otherPage
//
//  Created by 金现代 on 2021/1/8.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewCon.h"
#import "ViewController.h"

@interface ViewCon ()
{
    UILabel *label;
    UIView *view;
    NSString *MyStr;
}

@end

@implementation ViewCon

- (void)viewDidLoad {
    
    NSLog(@"发阿发");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    label.text = @"这是另一个页面";
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
   
     UIButton *test = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 280,40)];
    [test setTitle:@"返回" forState:UIControlStateNormal];
    [test setBackgroundColor: [UIColor lightGrayColor]];
    [test setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    
    [test setBackgroundColor:[UIColor blueColor]];
    
    [test setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [test addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:test];
    
//    label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label];
    
    //初始化文本框
    
    self.MyText=[[UITextField alloc] initWithFrame:CGRectMake(100, 100,200,50)];
    
    self.MyText.borderStyle=1;
    
    self.MyText.delegate=self;
    
    //将字符串赋给文本框
    
    self.MyText.text=self.MyStr;
    
    //在父视图上添加文本框
    
    [self.view addSubview:self.MyText];
    
}

- (void)back{
    ViewController *vi = [[ViewController alloc]init];
//    [self.navigationController pushViewController:vi animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    [self dismissViewControllerAnimated:YES completion:nil]
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
