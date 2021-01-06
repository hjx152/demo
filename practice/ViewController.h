//
//  ViewController.h
//  practice
//
//  Created by 金现代 on 2021/1/5.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UILabel *myLabel;
    
    UITextField *myTextField;
    UIPickerView *myPickerView;
    NSArray *pickerArray;
}


//@property
//IBOutlet UILabel *myLabel;

- (void)addLabel;

-(IBAction) setTitleLabel:(id)sender;

@end

