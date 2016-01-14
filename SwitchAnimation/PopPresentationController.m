//
//  PopPresentationController.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/14.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//



/*
 
 UIPresentationController
 属性:相关的两个视图控制器
 presentedViewController  : 顶部视图控制器（该视图控制器就是使用present显示的控制器）
 presentedView            : 使用present显示的控制器的视图（presentedViewController.view）
 presentedViewController.view !=presentView

 containerView            : 该容器视图在presentedView下面，但是在调用present控制器对应视图的上面
 presentingViewController : 底部视图控制器(查看视图的层次结构发现presentingViewController.view在调用present控制器对应视图的下面，不清楚该控制器和视图有什么意义)
 
 
 
 
 视图顺序顶到底：presentedView > containerView > 调用present控制器对应视图 > presentingViewController.view对应的视图 > UIApplication keyWindow对应的视图
 
 使用Present方式显示的控制器可以通过属性：presentationController(只读)获取到所在的UIPresentationController
 
 ChildViewController *child=[[ChildViewController alloc]init];
 //child使用present的方式显示后会自动创建一个UIPresentationController来控制child
 child.presentationController.presentedViewController==child YES
 注意：不要使用child.presentedViewController 来获取child 他的返回值会是nil
 
 child.presentationController.presentingViewController==child.presentingViewController YES
 child.presentationController.presentedView 可以获取到child的View
 
 
 设置modalPresentationStyle为popover时
 child.modalPresentationStyle=UIModalPresentationPopover
 NSLog(@"%@",child.presentationController);
 NSLog(@"%@",child.popoverPresentationController);
 child.presentationController==child.popoverPresentationController  YES
 
 其他modelPresentationStyle时popoverPresentationController为nil
 */

#import "PopPresentationController.h"

@implementation PopPresentationController



/*
 实现UIViewControllerTransitioningDelegate方法的不设置显示和隐藏时该方法会显示相应的视图

 presented view 在present相应变化结束后的位置信息（默认是containerView的bounds）
 */
- (CGRect)frameOfPresentedViewInContainerView{
    return CGRectInset(self.containerView.bounds, self.insetX, self.insetY);
    
}




/*
 呈现过渡即将开始
 实现UIViewControllerTransitioningDelegate方法的显示(隐藏可以不实现)时需实现该方法才会显示相应的视图
 */
- (void)presentationTransitionWillBegin{

    //注意不要直接设置alpha的，它会影响子视图
    self.containerView.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:self.alpha];
   
    //返回presented控制器对应的视图
    self.presentedView.frame= [self frameOfPresentedViewInContainerView];
    [self.containerView addSubview:self.presentedView];
    
    
}


/*
 呈现过渡结束
 */
- (void)presentationTransitionDidEnd:(BOOL)completed{

    if(self.containerViewEnableDismiss){
        
        //设置点击背景图层dismiss
        UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissView)];
        [self.containerView addGestureRecognizer:gesture];
        
    }
    
}


-(void) dismissView{
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}


/*
 隐藏即将开始
 */
- (void)dismissalTransitionWillBegin{
    
}

/*
 隐藏结束
 */
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    
    if(completed){
        
        [self.containerView removeFromSuperview];
        //[self.presentedView removeFromSuperview];
    }

}


@end
