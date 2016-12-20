//
//  TransitionViewController.h
//  CustomPresentAnimation
//
//  Created by daisuke on 2016/12/20.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionModel.h"

@interface TransitionViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) TransitionModel *transitionModel;

@end
