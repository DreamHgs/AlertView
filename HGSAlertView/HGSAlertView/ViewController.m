//
//  ViewController.m
//  HGSAlertView
//
//  Created by 洪泽泓 on 15/8/3.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ViewController.h"
#import "HGSAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)showAlert:(UIButton *)sender {
    HGSAlertView *alert = [[HGSAlertView alloc]init];
    [alert setConfirmBlock:^{
        NSLog(@"在这里面你可以实现点击确认按钮后将要实现的功能");
    }];
    [alert createAlertWithTitle:@"温馨提示" andMessage:@"这是提示的内容哦~" andTimeout:4 andCancelButton:@"取消" andConfirmButton:@"确认"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
