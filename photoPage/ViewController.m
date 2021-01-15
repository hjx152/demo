//
//  ViewController.m
//  photoPage
//
//  Created by 金现代 on 2021/1/15.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"
#import "XMQueue.h"

@interface ViewController ()

// 轮播图视图
@property (nonatomic,strong) UIView *contentView;
///轮播图片地址集合
@property (nonatomic,strong) NSMutableArray<NSString *> *imageUrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   CircleLayout *layout = [[CircleLayout alloc] init];
    
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//
//    self = [super initWithFrame:frame];
//
//
//    if (self) {
//
//        ///初始化轮播图视图
//        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        ///超出部分裁剪
//        _contentView.clipsToBounds = YES;
//        ///添加到XMRotationChartView
//        [self addSubview:_contentView];
//
//    }
//    return self;
//}

@end
