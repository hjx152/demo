//
//  ViewController.m
//  otherPage
//
//  Created by 金现代 on 2021/1/7.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"
#import "../newPage/ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setBackgroundColor: [UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button setFrame:CGRectMake(60, 100, 200, 40)];
    [button setTitle:@"这是个按钮" forState:UIControlStateNormal];
    
    button.showsTouchWhenHighlighted=YES;
    button.adjustsImageWhenHighlighted =YES;
    
     [self.view addSubview:button];
    
    [button addTarget:self action:@selector(toPage) forControlEvents:UIControlEventTouchUpInside];
    
    //    [button addTarget:self action:@selector(setTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    
//    [button addTarget:self action:@selector(title:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)toPage{
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController popToViewController:vc animated:(YES)];
}


@end
