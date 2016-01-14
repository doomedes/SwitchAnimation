//
//  AlphaAnimatedTransitioning.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/14.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "AlphaAnimatedTransitioning.h"

@implementation AlphaAnimatedTransitioning

//动画时间
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

//动画处理
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    if(self.ISPresented){
        //获取相应的视图 隐藏时：（presented控制器对应的视图）
        UIView *toview=[transitionContext viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toview.alpha=0.0;

        } completion:^(BOOL finished) {
            //重要：设置结束
            [transitionContext completeTransition:YES];
        }];
    }else{
        //获取对应的视图 显示时：（presented控制器对应的视图）
        UIView *toview=[transitionContext viewForKey:UITransitionContextToViewKey];
        toview.alpha=0.0;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toview.alpha=1.0;
            
        } completion:^(BOOL finished) {
            //重要：设置结束
            [transitionContext completeTransition:YES];
        }];
    }
    
    
    
}


@end
