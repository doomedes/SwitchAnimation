//
//  TransitioningViewController.h
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Transitioning)

@property (strong,nonatomic)  id<UIViewControllerTransitioningDelegate>  strongTransitioning;
@end
