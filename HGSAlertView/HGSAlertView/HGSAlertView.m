//
//  HGSAlertView.m
//  HanShi
//
//  Created by 洪泽泓 on 15/8/3.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "HGSAlertView.h"

@interface HGSAlertView()<UIAlertViewDelegate>
@property (strong, nonatomic) confirmAction confirmAction;
@property (strong, nonatomic) selectAction selectAction;
@property (strong, nonatomic) UIAlertView *alert;
@end

@implementation HGSAlertView

-(void)setConfirmBlock:(confirmAction)confirmBlock
{
    self.confirmAction = confirmBlock;
}
-(void)setSelectAction:(selectAction)block
{
    _selectAction = block;
}
-(void)createAlertWithTitle:(NSString *)title andMessage:(NSString *)message andTimeout:(NSTimeInterval)time andCancelButton:(NSString *)cancel andConfirmButton:(NSString *)confirm
{
    //可以根据自己的本地化进行修改
    title = title.length<=0 ? NSLocalizedString(@"alterTitle", nil) : title;
    cancel = cancel.length<=0?NSLocalizedString(@"cancelButton", nil) : cancel;
    confirm = confirm.length<=0?NSLocalizedString(@"confirmButton", nil):confirm;
    self.alert = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancel otherButtonTitles:confirm, nil];
    [self.alert show];
    
    if(time>0)
    {
        [self performSelector:@selector(removeAlertView) withObject:self afterDelay:time];
    }
}
-(void)createAlertNewWithButtons:(NSArray *)buttonTitles
{
    self.alert = [self initWithTitle:@"多按钮测试" message:@"回调多种函数" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
    for(NSString *string in buttonTitles)
    {
        [self.alert addButtonWithTitle:string];
    }
    
    [self.alert show];
}
-(void)removeAlertView
{
    [self.alert dismissWithClickedButtonIndex:0 animated:YES];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.numberOfButtons<=2)
    {
        if(buttonIndex==1)
        {
            self.confirmAction();
        }
    }else
    {
        self.selectAction((int)buttonIndex);
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
