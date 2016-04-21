//
//  ViewController.m
//  HZKAlertViewDemo
//
//  Created by mac on 16/4/21.
//  Copyright © 2016年 huangzhikai. All rights reserved.
//

#import "ViewController.h"
#import "HZKAlertview.h"

@interface ViewController ()<HZKAlertviewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)button1Click:(id)sender
{
    HZKAlertview *alertView = [[HZKAlertview alloc]initWithTitle:@"温馨提示" detial:@"一个确认按钮 + 取消按钮" detialTextAlignment:NSTextAlignmentCenter cancelBtnString:@"取消" otherBtnStringArray:@[@"确认"]];
    alertView.delegate = self;
    [alertView show];
    
}

- (IBAction)button2Click:(id)sender
{
    HZKAlertview *alertView = [[HZKAlertview alloc]initWithTitle:@"标题标题" detial:@"多个其他按钮 + 取消按钮" detialTextAlignment:NSTextAlignmentCenter cancelBtnString:@"取消" otherBtnStringArray:@[@"按钮1",@"按钮2",@"按钮3"]];
    alertView.delegate = self;
    [alertView show];
}

- (IBAction)button3Click:(id)sender
{
    HZKAlertview *alertView = [[HZKAlertview alloc]initWithTitle:@"标题标题" detial:@"只有其他按钮" detialTextAlignment:NSTextAlignmentCenter cancelBtnString:@"取消" otherBtnStringArray:@[@"确认"]];
    alertView.delegate = self;
    [alertView show];
}

- (IBAction)button4Click:(id)sender
{
    HZKAlertview *alertView = [[HZKAlertview alloc]initWithTitle:@"标题标题" detial:@"详情内容详情内容详情内容详情内容详情内容详情内容，只显示取消按钮" detialTextAlignment:NSTextAlignmentCenter cancelBtnString:@"取消" otherBtnStringArray:nil];
    alertView.delegate = self;
    [alertView show];
}

#pragma mark - HZKAlertviewDelegate
-(void)HZKAlertview:(HZKAlertview *)alertView ConfirmButtonClickButtonIndex:(NSUInteger)index WithInfo:(NSString *)info
{
    NSLog(@"其他按钮点击");
}

-(void)HZKAlertview:(HZKAlertview *)alertView CancelButtonClickWithInfo:(NSString *)info
{
    NSLog(@"取消按钮点击");
}


@end
