//
//  TransitioningViewController.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "UIViewController+Transitioning.h"
#import <objc/runtime.h>

#define strongTransitioningKey "strongTransitioning"

@implementation UIViewController (Transitioning)

//必须将UIViewControllerTransitioningDelegate保存起来否则会释放则dimiss则没有自定义的动画效果

-(void)setStrongTransitioning:(id<UIViewControllerTransitioningDelegate>)strongTransitioning{
    
        objc_setAssociatedObject(self,strongTransitioningKey,strongTransitioning,OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(id<UIViewControllerTransitioningDelegate>)strongTransitioning{
    
    return  objc_getAssociatedObject(self, strongTransitioningKey);
}

@end
