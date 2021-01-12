//
//  ViewController.m
//  otherPage
//
//  Created by 金现代 on 2021/1/7.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"
#import "ViewCon.h"
//#import "Page.h"
//#import "../Page1/WenZi.h"

@interface ViewController ()
{
    UIButton *button;
    UITextField *test;
}

@property(strong,nonatomic) UITextField *MyText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setBackgroundColor: [UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button setFrame:CGRectMake(60, 200, 200, 40)];
    [button setTitle:@"这是个按钮" forState:UIControlStateNormal];
    
    button.showsTouchWhenHighlighted=YES;
    button.adjustsImageWhenHighlighted =YES;
    
    
    [button addTarget:self action:@selector(toPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    self.MyText=[[UITextField alloc] initWithFrame:CGRectMake(60, 100, 200, 50)];
    
    self.MyText.borderStyle = UITextBorderStyleRoundedRect;
    
    self.MyText.keyboardType = UIKeyboardTypePhonePad;
    
    self.MyText.delegate = self;
    
    self.MyText.tintColor=[UIColor redColor];
    
    [self.view addSubview:self.MyText];
    
    
    //    [button addTarget:self action:@selector(setTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [button addTarget:self action:@selector(title:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)toPage:(UIButton *)btn{
    
    NSLog(@"这是打印的");
    
    ViewCon *v1 = [[ViewCon alloc]init];
    
    [self.navigationController pushViewController:v1 animated:YES];
 
    NSArray *array= [NSArray arrayWithObjects:@"tom", @"jack",@"java",nil];
    
    int count = [array count];
    NSLog(@"count%d",count);
    
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    [arr addObject:@"abc"];
    [arr addObjectsFromArray:@[@"h啊哈",@"发丝"]];
    
    
    v1.MyStr = self.MyText.text;
    
    
    
//    page *p1 = [[page alloc]init];
//    ViewCon *v1 = [ViewCon alloc];
    
//    ViewCon *v1 = [self.storyboard instantiateViewControllerWithIdentifier:@"id"];
    
    
//    [self presentViewController:v1 animated:YES completion:nil];
    
//    [self presentViewController:v1 animated:YES completion:^{
//        NSLog(@"sf");
//    }];
    
    //    [self .navigationController popToRootViewControllerAnimated: YES ];
    
    //    WenZi *wz = [[WenZi alloc]init];
    //    [self.navigationController pushViewController:wz animated:YES];
    
    
}

- (void)editor{
    if ([button.titleLabel.text isEqualToString:@"这是个按钮"]) {
        [button setTitle:@"换名字了" forState:UIControlStateNormal];
    }
    else {
        [button setTitle:@"换回来了" forState:UIControlStateNormal];
    }
}



@end
