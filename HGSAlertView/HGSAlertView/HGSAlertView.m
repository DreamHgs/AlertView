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
@property (strong, nonatomic) UIAlertView *alert;
@end

@implementation HGSAlertView

-(void)setConfirmBlock:(confirmAction)confirmBlock
{
    self.confirmAction = confirmBlock;
}

-(void)createAlertWithTitle:(NSString *)title andMessage:(NSString *)message andTimeout:(NSTimeInterval)time andCancelButton:(NSString *)cancel andConfirmButton:(NSString *)confirm
{
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
-(void)removeAlertView
{
    [self.alert dismissWithClickedButtonIndex:0 animated:YES];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        self.confirmAction();
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
