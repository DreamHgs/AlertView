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
- (IBAction)showManyButtons:(UIButton *)sender {
    
    HGSAlertView *alert = [[HGSAlertView alloc]init];
    [alert setSelectAction:^(int index) {
        //可以根据点击的不同索引选中执行不同方法
        NSLog(@"我点击了第%d个",index);
    }];
    [alert createAlertNewWithButtons:@[@"点击1",@"点击2",@"点击3"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
