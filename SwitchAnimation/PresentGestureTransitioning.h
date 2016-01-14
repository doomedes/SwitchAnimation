//
//  PresentTransitioning.h
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/*
 
 自定义present显示动画效果
 
 */
@interface PresentGestureTransitioning : NSObject<UIViewControllerTransitioningDelegate>

/*
绑定相应的vc并且为该vc拥有的view添加一个UIScreenEdgePanGestureRecognizer手势
 */
-(void) binddingVCAddGeusture:(UIViewController *) vc;

@end
