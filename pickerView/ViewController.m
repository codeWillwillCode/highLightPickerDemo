//
//  ViewController.m
//  pickerView
//
//  Created by 叶 on 15/8/10.
//  Copyright (c) 2015年 six. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    NSUInteger _selectedRow;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPickerView *pick = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    pick.delegate = self;
    [self.view addSubview:pick];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _selectedRow = row;
    [pickerView reloadComponent:component];
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    BOOL isSelectedRow = row == _selectedRow;
    
    NSString *yourString = [self pickerView:pickerView titleForRow:row forComponent:component];
    NSDictionary *attributeDict = @{
                                    NSForegroundColorAttributeName : isSelectedRow?[UIColor blueColor]:[UIColor blackColor],
                                    NSFontAttributeName :isSelectedRow?[UIFont systemFontOfSize:18]:[UIFont systemFontOfSize:15]
                                    };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:yourString attributes:attributeDict];
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.attributedText = attributedString;
    
    return label;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return @"123";
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 111;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  2;
}


@end
