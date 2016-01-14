//
//  ViewController.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"
#import "PresentGestureTransitioning.h"
#import "PresentStyleTransitioning.h"
#import "UIViewController+Transitioning.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title=@"root";
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]
                               initWithTitle:@"back"
                               style:UIBarButtonItemStyleDone
                               target:self
                               action:@selector(leftItemClick)];
    
    self.navigationItem.leftBarButtonItem=leftItem;
    
}


-(void) leftItemClick{
    NSLog(@"back click");
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    /*
     
     // NavigationController自带的手势返回（pop）测试
     //    ChildViewController *child=[[ChildViewController alloc]init];
     //    [self.navigationController pushViewController:child animated:YES];
     
     */

    
     ChildViewController *child=[[ChildViewController alloc]init];

    //系统自带的效果就四种：翻转、向上移动、淡入淡出、翻页 可以自己定义
    //child.modalTransitionStyle=UIModalTransitionStyleCoverVertical;

    
    /*
     
     //动画一：手势dismiss
     
     child.modalPresentationStyle=UIModalPresentationCustom;
     PresentGestureTransitioning * transitioningDelegate=[[PresentGestureTransitioning alloc]init];
     child.strongTransitioning=transitioningDelegate;
     child.transitioningDelegate=transitioningDelegate;
     [transitioningDelegate binddingVCAddGeusture:child];
     [self presentViewController:child animated:YES completion:nil];
     
     */
    
    
    
    child.modalPresentationStyle=UIModalPresentationCustom;
    PresentStyleTransitioning * transitioningDelegate=[[PresentStyleTransitioning alloc]init];
    child.strongTransitioning=transitioningDelegate;
    child.transitioningDelegate=transitioningDelegate;
    
    
    [self presentViewController:child animated:YES completion:nil];
    
    
    
    
}

@end
