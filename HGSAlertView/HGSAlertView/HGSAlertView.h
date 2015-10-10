//
//  HGSAlertView.h
//  HanShi
//
//  Created by 洪泽泓 on 15/8/3.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^confirmAction)();
typedef void (^cancelAction)();
typedef void (^selectAction)(int index);

@interface HGSAlertView : UIAlertView

/*
 设置确认行为的回调的函数
 */
-(void)setConfirmBlock:(confirmAction)confirmBlock;

/**
 设置点击的位置回调函数
 */
-(void)setSelectAction:(selectAction)block;
/**
 * 创建一个提示框并展示
 @param title 提示框的标题
 @param message 提示框的主题内容
 @param time 经过多久提示框自动消失，当time>0的适合会自动消失，若小于等于0，那么提示框将不会自动消失
 @param cancel 取消按钮展示的文字
 @param confirm 确定按钮展示的文字
 */
-(void)createAlertWithTitle:(NSString *)title andMessage:(NSString *)message andTimeout:(NSTimeInterval)time andCancelButton:(NSString *)cancel andConfirmButton:(NSString *)confirm;
-(void)createAlertNewWithButtons:(NSArray *)buttonTitles;
@end
