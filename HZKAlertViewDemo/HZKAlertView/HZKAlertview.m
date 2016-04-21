//
//  HZKAlertview.m
//  AutoParts
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 jinglong. All rights reserved.
//

#import "HZKAlertview.h"
#import "UIView+Extension.h"

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
#define HZKColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HZKColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]


@interface HZKAlertview()
{
    UIView *_backView;
}

@end

@implementation HZKAlertview


-(instancetype)initWithTitle:(NSString *)title detial:(NSString *)detial detialTextAlignment:(NSTextAlignment)textAlignment cancelBtnString:(NSString *)cancelSting  otherBtnStringArray:(NSArray*)otherBtnStringArray
{
    self = [super init];
    if (self) {
        
        [self setTitle:title detial:detial detialTextAlignment:textAlignment cancelBtnString:cancelSting otherBtnStringArray:otherBtnStringArray];
        
    }
    return self;
}


-(void)setTitle:(NSString *)title detial:(NSString *)detial detialTextAlignment:(NSTextAlignment)textAlignment cancelBtnString:(NSString *)cancelSting  otherBtnStringArray:(NSArray*)otherBtnStringArray
{
    
    self.backgroundColor = HZKColorA(0, 0, 0, 0.4);
    self.frame = CGRectMake(0, 0, fDeviceWidth, fDeviceHeight);
    
    UIView *backView = [[UIView alloc] init];
    backView.layer.cornerRadius = 5;
    backView.backgroundColor = HZKColor(242, 242, 242);
    backView.width = self.width - 30;
    _backView = backView;
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, backView.width - 20, 35)];
    titleLabel.numberOfLines = 2;
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16.f];
    [backView addSubview:titleLabel];
    

    //详细信息label
    UILabel *detialLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 5, backView.width - 30, 0)];
    detialLabel.font = [UIFont systemFontOfSize:14.f];
    detialLabel.numberOfLines = 0;
    detialLabel.textAlignment = textAlignment;
    if (detial == nil) {
        detial = @"";
    }
    
    //算出详细信息的高度
    NSDictionary *attributes = @{NSFontAttributeName:detialLabel.font};
    CGSize contentLabelSize = [detial boundingRectWithSize:CGSizeMake(detialLabel.width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    detialLabel.height = contentLabelSize.height + 5;
    detialLabel.text = detial;
    [backView addSubview:detialLabel];
    
    
    
    //算出多少个按钮 并添加按钮
    NSMutableArray *btnArray = [NSMutableArray array];
    //其他按钮
    int tag = 101;
    if (otherBtnStringArray != nil && otherBtnStringArray.count > 0) {
        
        for (NSString *btnString in otherBtnStringArray)
        {
            UIButton *btn = [[UIButton alloc] init];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = tag;
            tag ++;
            [btn setTitleColor:[UIColor colorWithRed:1/255.0 green:136/255.0 blue:46/255.0 alpha:1.0] forState:UIControlStateNormal];
            [btn setTitle:btnString forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
            
            
            [backView addSubview:btn];
            [btnArray addObject:btn];
        }
        
    }
    //取消按钮
    if (cancelSting != nil) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100;
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitle:cancelSting forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [backView addSubview:btn];
        [btnArray addObject:btn];
    }

    //布局按钮的位置
    int btnY = CGRectGetMaxY(detialLabel.frame) + 10;
    int btnWidth = backView.width;
    int btnHeight = 40;
    int btnX = 0;
    
    if (btnArray.count == 1) {
        
        //灰色横线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, btnY, backView.width, 0.5)];
        line.backgroundColor  = HZKColor(204, 204, 204);
        [backView addSubview:line];
        //白色线
        UIView *line1 = [[UIView alloc] initWithFrame:line.frame];
        line1.y  = line.y  + 0.5;
        line1.backgroundColor  = [UIColor whiteColor];
        [backView addSubview:line1];
        
        UIButton *btn = btnArray[0];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        
        btnY = btnY + btnHeight;
    }
    else if(btnArray.count > 1)
    {
        
        
        for (int i = 0; i < btnArray.count; i ++) {
            
            //灰色横线
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, btnY, backView.width, 0.5)];
            line.backgroundColor  = HZKColor(204, 204, 204);
            [backView addSubview:line];
            //白色线
            UIView *line1 = [[UIView alloc] initWithFrame:line.frame];
            line1.y  = line.y  + 0.5;
            line1.backgroundColor  = [UIColor whiteColor];
            [backView addSubview:line1];
            
            UIButton *btn = btnArray[i];
            
            btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            btnY = btnY + btnHeight;

        }
        
    }
    
    backView.height = btnY + 5;
    backView.centerX = fDeviceWidth / 2;
    backView.centerY = fDeviceHeight / 2;
    _backView = backView;
    [self addSubview:backView];
    
    
    
}


-(void)btnClick:(UIButton *)btn
{
    
    NSUInteger tag = btn.tag;
    if (tag == 100) { //取消按钮点击
        
        if ([self.delegate respondsToSelector:@selector(HZKAlertview:CancelButtonClickWithInfo:)]) {
            [self.delegate HZKAlertview:self CancelButtonClickWithInfo:_info];
        }
    }
    else if(tag > 100) //其他按钮点击
    {
        if ([self.delegate respondsToSelector:@selector(HZKAlertview:ConfirmButtonClickButtonIndex:WithInfo:)]) {
            [self.delegate HZKAlertview:self ConfirmButtonClickButtonIndex:(tag - 100) WithInfo:_info];
        }
    }
    
    [self removeFromSuperview];
    
}


-(void)remove{
    
    if ([self.delegate respondsToSelector:@selector(HZKAlertview:CancelButtonClickWithInfo:)]) {
        [self.delegate HZKAlertview:self CancelButtonClickWithInfo:_info];
    }
    
    [self removeFromSuperview];
}
-(void)show
{
    dispatch_async(dispatch_get_main_queue(), ^{

        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
            _backView.alpha = 0.3;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            _backView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];

        
    });

}


@end
