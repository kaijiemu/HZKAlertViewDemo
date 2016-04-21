//
//  HZKAlertview.h
//  AutoParts
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 jinglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZKAlertview;

@protocol HZKAlertviewDelegate <NSObject>

@optional

/**
 *  取消按钮点击通知
 *
 *  @param info  需求回传的信息
 */

- (void)HZKAlertview:(HZKAlertview *)alertView CancelButtonClickWithInfo:(NSString *)info;

/**
 *  其他按钮点击通知
 *
 *  @param index 哪个按钮点击 从1开始算
 *  @param info  需求回传的信息
 */
- (void)HZKAlertview:(HZKAlertview *)alertView ConfirmButtonClickButtonIndex:(NSUInteger)index  WithInfo:(NSString *)info;

@end


@interface HZKAlertview : UIView

/** 代理 */
@property (nonatomic, weak) id<HZKAlertviewDelegate> delegate;

/**
 *  初始化弹框控件
 *
 *  @param frame
 *  @param title               标题
 *  @param detial              详细内容
 *  @param textAlignment       详细内容文本位置
 *  @param cancelSting         取消按钮
 *  @param otherBtnStringArray 其他按钮：可以多个
 *
 *  @return 返回控件
 */
-(instancetype)initWithTitle:(NSString *)title detial:(NSString *)detial detialTextAlignment:(NSTextAlignment)textAlignment cancelBtnString:(NSString *)cancelSting  otherBtnStringArray:(NSArray*)otherBtnStringArray;

/**
 *  显示控件
 */
-(void)show;

/**
 *  移除控件
 */
-(void)remove;


#pragma mark -- 传递的数据
/**保存记录需要传递的数据*/
@property(nonatomic,copy)NSString *info;

@end
