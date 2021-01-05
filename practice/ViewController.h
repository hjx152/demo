//
//  ViewController.h
//  practice
//
//  Created by 金现代 on 2021/1/5.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UILabel *myLabel;
}

+ (id)buttonWithType:(UIButtonType)buttonType;
- (UIImage *)backgroundImageForState:(UIControlState)state;
- (UIImage *)imageForState:(UIControlState)state;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)addTarget:(id)target action:(SEL)action forControlEvents: (UIControlEvents) controlEvents;

//@property
//IBOutlet UILabel *myLabel;

- (void)addLabel;

-(IBAction) setTitleLabel:(id)sender;

@end

