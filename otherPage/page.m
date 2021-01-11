//
//  page.m
//  otherPage
//
//  Created by 金现代 on 2021/1/8.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "page.h"
#import "ViewCon.h"

@interface page ()
{
    UIButton *button;
    UILabel *label;
}
@end

@implementation page

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setBackgroundColor: [UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:
     UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button setFrame:CGRectMake(60, 100, 200, 40)];
    [button setTitle:@"这是个按钮" forState:UIControlStateNormal];
    
    button.showsTouchWhenHighlighted=YES;
    button.adjustsImageWhenHighlighted =YES;
    
    
    [button addTarget:self action:@selector(toPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    label.text = @"这是另一个页面";
    //    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    //    label.textAlignment = UITextAlignmentCenter;
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

- (void)toPage:(UIButton *)btn{
    
//    NSLog(@"这是打印的");
    
    ViewCon *v1 = [ViewCon alloc];
    [self.navigationController pushViewController:v1 animated:YES];
    
    //    [self .navigationController popToRootViewControllerAnimated: YES ];
    
    //    WenZi *wz = [[WenZi alloc]init];
    //    [self.navigationController pushViewController:wz animated:YES];
    
    
}


@end
