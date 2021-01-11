//
//  ViewCon.h
//  otherPage
//
//  Created by 金现代 on 2021/1/8.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PostValueBlock)(NSString *Infor);

@interface ViewCon : UIViewController<UITextFieldDelegate>

@property(strong,nonatomic) NSString *MyStr;

@property(strong,nonatomic) UITextField *MyText;

@property(strong,nonatomic) PostValueBlock MyBlock;

@end

NS_ASSUME_NONNULL_END
