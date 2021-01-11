//
//  ViewCon.m
//  practice
//
//  Created by 金现代 on 2021/1/8.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewCon.h"

@interface ViewCon ()
{
    UILabel *label;
}
@end

@implementation ViewCon

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    label.text = @"这是另一个页面";
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label];
    
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
