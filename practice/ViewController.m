//
//  ViewController.m
//  practice
//
//  Created by 金现代 on 2021/1/5.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
    
    UILabel *label2;
    
    BOOL flag;
    
}

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


-(void)addPickerView{
    pickerArray = [[NSArray alloc]initWithObjects:@"Chess",
                   @"Cricket",@"Football",@"Tennis",@"Volleyball", nil];
    myTextField = [[UITextField alloc]initWithFrame:
                   CGRectMake(10, 300, 300, 30)];
    myTextField.borderStyle = UITextBorderStyleRoundedRect;
    myTextField.textAlignment = UITextAlignmentCenter;
    myTextField.delegate = self;
    [self.view addSubview:myTextField];
    [myTextField setPlaceholder:@"Pick a Sport"];
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-200, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    myTextField.inputView = myPickerView;
    myTextField.inputAccessoryView = toolBar;
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
//        [self dateChanged:nil];
    }
}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [myTextField setText:[pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPickerView];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 280, 80)];
    label.text = @"手写代码啊1111";
    label.textColor = [UIColor greenColor];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label];
    
    
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 400, 280, 80)];
    label2.text = @"这是第二段文字";
    label2.textColor = [UIColor greenColor];
    label2.numberOfLines = 0;
    label2.backgroundColor = [UIColor clearColor];
    label2.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label2];
    
    
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
    
//    [button addTarget:self action:@selector(setTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    
    [button addTarget:self action:@selector(title:) forControlEvents:UIControlEventTouchUpInside];
    
    flag = YES;
    if (flag == YES) {
        [button setTag:1];
    } else {
        [button setTag:2];
    }
    
//    [self title:flag];
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(60, 150, 200, 40)];
    [button2 setBackgroundColor:[UIColor lightGrayColor]];
    [button2 setTitle:@"这是第二个按钮" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
//    [button2 addTarget:self action:@selector(changed:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTag:2];
    [button2 addTarget:self action:@selector(title:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self addLabel];
//    [self addButton];
}

- (void)setTitleLabel:(id)sender{
//    [myLabel setText:@"hello"];
    label.text = @"ss";
}

- (void)changed:(id)sender{
    label.text = @"a哦豁";
}

- (void)title:(id)type{
    UIButton *btn = (UIButton *)type;
    switch (btn.tag) {
        case 1:
            label2.text = @"变回来了";
            flag = NO;
            break;
            
        default:
            label2.text = @"代码代码";
            flag = YES;
            break;
    }
    
}

- (void)change:(UIButton *)button{
//    UIButton *btn = (UIButton *)sender;
    button.selected = !button.selected;
    int a = [button tag];
    
}


@end
