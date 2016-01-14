//
//  HorizontralTransitioning.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "HorizontralTransitioning.h"

@implementation HorizontralTransitioning

#pragma mark UIViewControllerAnimatedTransitioning


//动画耗时
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.2;
}



/*
 动画操作
 
 UIViewControllerContextTransitioning表示切换上下文包含了从哪个VC到哪个VC等各类信息
 
 -(UIView *)containerView; VC切换所发生的view容器，开发者应该将切出的view移除，将切入的view加入到该view容器中。
 -(UIViewController )viewControllerForKey:(NSString )key; 提供一个key，返回对应的VC。现在的SDK中key的选择只有UITransitionContextFromViewControllerKey和UITransitionContextToViewControllerKey两种，分别表示将要切出和切入的VC。
 -(CGRect)initialFrameForViewController:(UIViewController *)vc; 某个VC的初始位置，可以用来做动画的计算。
 -(CGRect)finalFrameForViewController:(UIViewController *)vc; 与上面的方法对应，得到切换结束时某个VC应在的frame。
 -(void)completeTransition:(BOOL)didComplete; 向这个context报告切换已经完成。
 
 */
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

    UIViewController *fromVC=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *containerView=[transitionContext containerView];
    CGSize size=[UIScreen mainScreen].bounds.size;
    
    //切入
    if(self.isPresent){
        [containerView addSubview:toVC.view];
        CGRect ef=[transitionContext finalFrameForViewController:toVC];
        if(self.Direction==left){
            toVC.view.frame=CGRectMake(size.width, 0, size.width, size.height);
            
        }else if(self.Direction==top){
            toVC.view.frame=CGRectMake(0, size.height, size.width, size.height);
            
        }else if(self.Direction==right){
            toVC.view.frame=CGRectMake(-size.width, 0, size.width, size.height);
            
        }else if(self.Direction==buttom){
            toVC.view.frame=CGRectMake(0, -size.height, size.width, size.height);
            
        }
        
       
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            toVC.view.frame=ef;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
        
        
    }else{


        CGRect ef=[transitionContext finalFrameForViewController:fromVC];
        
        if(self.Direction==left){
            ef=CGRectMake(-size.width, 0, size.width, size.height);
            
        }else if(self.Direction==top){
            ef=CGRectMake(0, -size.height, size.width, size.height);
            
        }else if(self.Direction==right){
            ef=CGRectMake(size.width, 0, size.width, size.height);
            
        }else if(self.Direction==buttom){
            ef=CGRectMake(0, size.height, size.width, size.height);
            
        }
        
        //注意动画要匀速        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
             fromVC.view.frame=ef;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];

        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//                fromVC.view.frame=ef;
//            }
//            completion:^(BOOL finished) {
//                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//            }];
    }

    
    
}



@end
