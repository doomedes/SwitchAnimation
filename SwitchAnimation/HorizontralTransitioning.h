//
//  HorizontralTransitioning.h
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//动画方向 0、1、2、3 左 上 又 下
typedef NS_ENUM(NSInteger,animationDirection)  {
    left=0,
    top,
    right,
    buttom
};


@interface HorizontralTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property(assign,nonatomic) animationDirection Direction;
//是present还是dismiss
@property(assign,nonatomic) BOOL isPresent;
@end


