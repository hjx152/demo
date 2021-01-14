//
//  ViewController.h
//  newPage
//
//  Created by 金现代 on 2021/1/12.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *arr;
}

@property(nonatomic,copy) NSString *pname;
@property(nonatomic,assign) int age;
-(instancetype)initWithPname:(NSString *)pname andage:(int)age;
+(instancetype)personWithinit:(NSString *)pname andage:(int)age;

@end

