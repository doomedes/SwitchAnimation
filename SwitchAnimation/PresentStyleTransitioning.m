//
//  PresentStyleTransitioning.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/14.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "PresentStyleTransitioning.h"
#import "PopPresentationController.h"
#import "AlphaAnimatedTransitioning.h"
@implementation PresentStyleTransitioning

//模态视图出现的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{

 AlphaAnimatedTransitioning * transitioning=  [[AlphaAnimatedTransitioning alloc]init];
    transitioning.ISPresented=NO;
    return transitioning;
    
}
//模态视图消失的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    AlphaAnimatedTransitioning * transitioning=  [[AlphaAnimatedTransitioning alloc]init];
    transitioning.ISPresented=YES;
    return transitioning;
    
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;


/*
 
 返回自定义的UIPresentationController
 （在自定义的UIPresentationController中重写父类的方法设置presenting和presented控制器对应的视图）
 
 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    PopPresentationController *popPresent=  [[PopPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    popPresent.insetX=50;
    popPresent.insetY=100;
    popPresent.alpha=0.5;

    return popPresent;
}






@end
