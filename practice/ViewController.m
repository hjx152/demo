//
//  ViewController.m
//  practice
//
//  Created by 金现代 on 2021/1/5.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)addLabel{
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
//    label.text = @"手写代码啊";
//    label.textColor = [UIColor greenColor];
//    label.numberOfLines = 0;
//    label.backgroundColor = [UIColor clearColor];
//    label.textAlignment = UITextAlignmentCenter;
//    [self.view addSubview:label];
//}



//-(void)addButton
//{
//    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
//    [button setBackgroundColor: [UIColor lightGrayColor]];
//    [button setTitleColor:[UIColor blackColor] forState:
//     UIControlStateHighlighted];
//
//    [button setBackgroundColor:[UIColor blueColor]];
//
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//
//    [button setFrame:CGRectMake(60, 100, 200, 40)];
//    [button setTitle:@"这是个按钮" forState:UIControlStateNormal];
//
////     [button addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:button];
//
//
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    myLabel.text = @"手写代码啊1111";
    myLabel.textColor = [UIColor greenColor];
    myLabel.numberOfLines = 0;
    myLabel.backgroundColor = [UIColor clearColor];
    myLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:myLabel];
    
    
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
    
    [button addTarget:self action:@selector(setTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTag:100];
    
    
    [self.view addSubview:button];

    
    // Do any additional setup after loading the view, typically from a nib.
//    [self addLabel];
//    [self addButton];
}

- (void)setTitleLabel:(id)sender{
//    [myLabel setText:@"hello"];
    myLabel.text = @"hello";
}

- (void)change:(UIButton *)button{
//    UIButton *btn = (UIButton *)sender;
    button.selected = !button.selected;
    int a = [button tag];
    
}


@end
