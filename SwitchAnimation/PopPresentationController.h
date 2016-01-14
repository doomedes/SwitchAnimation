//
//  PopPresentationController.h
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/14.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopPresentationController : UIPresentationController

@property (assign,nonatomic) float insetX;
@property (assign,nonatomic) float insetY;

@property(assign,nonatomic)  float alpha;//背景图层的透明度
@property(assign,nonatomic) BOOL containerViewEnableDismiss;//背景图层点击是否可以dismiss present

@end
