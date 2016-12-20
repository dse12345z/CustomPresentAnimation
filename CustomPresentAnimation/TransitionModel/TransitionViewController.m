//
//  TransitionViewController.m
//  CustomPresentAnimation
//
//  Created by daisuke on 2016/12/20.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import "TransitionViewController.h"

@implementation TransitionViewController

#pragma mark - UIVieControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.transitionModel;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.transitionModel;
}

@end
