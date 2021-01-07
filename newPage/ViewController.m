//
//  ViewController.m
//  newPage
//
//  Created by 金现代 on 2021/1/7.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    label.text = @"这是另一个页面";
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label];
    
}


@end
