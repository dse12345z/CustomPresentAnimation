//
//  TransitionModel.h
//  TransitionModel
//
//  Created by daisuke on 2016/12/20.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PresentImitate) {
    PresentImitatePush,
    PresentImitateFadeIn
};

typedef NS_ENUM(NSInteger, DismissImitate) {
    DismissAnimationPop,
    DismissAnimationFadeOut
};

@interface TransitionModel : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) PresentImitate presentImitate;
@property (nonatomic, assign) DismissImitate dismissImitate;

@end
