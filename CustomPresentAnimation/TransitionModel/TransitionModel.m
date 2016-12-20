//
//  TransitionModel.m
//  TransitionModel
//
//  Created by daisuke on 2016/12/20.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import "TransitionModel.h"

@interface TransitionModel()

@property (weak, nonatomic) UIViewController *preViewController;
@property (weak, nonatomic) UIViewController *nextViewController;

@end

@implementation TransitionModel

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    if (self.preViewController == nil || self.nextViewController == nil) {
        // 記錄上下頁的關係
        self.preViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        self.nextViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }
    
    UIViewController *viewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    BOOL isShowAnimation = (self.nextViewController == viewController);
    if (isShowAnimation) {
        [self presentViewController:transitionContext];
    }
    else {
        [self dismissViewController:transitionContext];
    }
}

#pragma mark - private instance method

#pragma mark * animation

- (void)presentViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = self.preViewController;
    UIViewController *toViewController = self.nextViewController;
    switch (self.presentImitate) {
        case PresentImitatePush:
        {
            // 初始化 present 出來的 view
            CGRect frame = fromViewController.view.frame;
            frame.origin.x = CGRectGetWidth([UIScreen mainScreen].bounds);
            toViewController.view.frame = frame;
            
            // 動畫過場容器，加入要做過場效果的 view
            UIView *container = [transitionContext containerView];
            [container addSubview:toViewController.view];
            
            // 主要動畫效果
            [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations: ^{
                toViewController.view.frame = fromViewController.view.frame;
                
                CGRect fromFrame = fromViewController.view.frame;
                fromFrame.origin.x = fromFrame.origin.x - 100;
                fromViewController.view.frame = fromFrame;
            } completion: ^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            break;
        }
            
        case PresentImitateFadeIn:
        {
            CGRect frame = fromViewController.view.frame;
            toViewController.view.frame = frame;
            toViewController.view.alpha = 0;
            
            UIView *container = [transitionContext containerView];
            [container addSubview:toViewController.view];

            [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations: ^{
                toViewController.view.alpha = 1;
            } completion: ^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            break;
        }
            
        default:
            break;
    }
}

- (void)dismissViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = self.nextViewController;
    UIViewController *toViewController = self.preViewController;
    switch (self.dismissImitate) {
        case DismissAnimationPop:
        {
            [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations: ^{
                toViewController.view.frame = fromViewController.view.frame;
                
                CGRect fromFrame = fromViewController.view.frame;
                fromFrame.origin.x = CGRectGetWidth([UIScreen mainScreen].bounds);
                fromViewController.view.frame = fromFrame;
            } completion: ^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            break;
        }
        
        case DismissAnimationFadeOut:
        {
            [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations: ^{
                fromViewController.view.alpha = 0;
            } completion: ^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            break;
        }
            
        default:
            break;
    }
}

@end
