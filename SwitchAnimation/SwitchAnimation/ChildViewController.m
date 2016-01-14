//
//  ChildViewController.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"child";
    
/*
 从iOS7开始，系统为UINavigationController提供了一个interactivePopGestureRecognizer用于右滑返回(pop),
 但是，如果自定了back button该手势就失效了。
 */
    //Modal的方式时不必看次代码
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]
                               initWithImage:[UIImage imageNamed:@"common_button_back"]
                               style:UIBarButtonSystemItemAction
                               target:self
                               action:@selector(leftItemClick)];

    self.navigationItem.leftBarButtonItem=leftItem;

}


-(void) leftItemClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
