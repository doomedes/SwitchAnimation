//
//  PresentTransitioning.m
//  SwitchAnimation
//
//  Created by yuanyongguo on 16/1/13.
//  Copyright © 2016年 yuanyongguo. All rights reserved.
//

#import "PresentGestureTransitioning.h"
#import "HorizontralTransitioning.h"
@interface PresentGestureTransitioning ()<UIGestureRecognizerDelegate>
@property(strong,nonatomic) UIPercentDrivenInteractiveTransition * interactiveTransition;
@property(strong,nonatomic)UIPercentDrivenInteractiveTransition *interactive;
@property(weak,nonatomic) UIViewController* binddingVC;

@end






@implementation PresentGestureTransitioning



-(void) binddingVCAddGeusture:(UIViewController *) vc{
    UIScreenEdgePanGestureRecognizer *gesture=[[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureCommand:)];
    gesture.edges=UIRectEdgeLeft;
    _binddingVC=vc;
    gesture.delegate=self;
    [vc.view addGestureRecognizer:gesture];
    
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
        return YES;
    
}


-(void)  panGestureCommand:(UIScreenEdgePanGestureRecognizer *)recognizer{
    UIView* view = self.binddingVC.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
            self.interactive = [UIPercentDrivenInteractiveTransition new];
            [self.binddingVC.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        //移动的像素
        CGPoint translation = [recognizer translationInView:view];
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
//        NSLog(@"%f",d);
        [self.interactive updateInteractiveTransition:d];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        //拖动速度
        if ([recognizer velocityInView:view].x > 0)
        {
            [self.interactive finishInteractiveTransition];
        } else {
            [self.interactive cancelInteractiveTransition];
        }
        self.interactive = nil;
    }
    
    
}

#pragma mark UIViewControllerTransitioningDelegate


//模态视图出现的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    HorizontralTransitioning *transitioning=[[HorizontralTransitioning alloc]init];
    transitioning.isPresent=YES;
    transitioning.Direction=left;
    return transitioning;
    
}
//模态视图消失的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    HorizontralTransitioning *transitioning=[[HorizontralTransitioning alloc]init];
    transitioning.isPresent=NO;
    transitioning.Direction=right;
    return transitioning;
    
}

/*
 交互式动画
 */
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return self.interactive;
}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0);

@end
