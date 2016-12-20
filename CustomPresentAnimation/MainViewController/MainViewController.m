//
//  MainViewController.m
//  CustomPresentAnimation
//
//  Created by AllenShiu on 2016/8/19.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import "MainViewController.h"
#import "PushViewController.h"

@implementation MainViewController

#pragma mark - IBAction

- (IBAction)presentViewAction:(id)sender {
    PushViewController *pushViewController = [PushViewController new];
    pushViewController.transitioningDelegate = self;
    pushViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:pushViewController animated:YES completion:nil];
}

#pragma mark - init

- (void)setupTransitionModels {
    // 設定自己的動畫參數
    self.transitionModel = [TransitionModel new];
    self.transitionModel.duration = 0.3f;
    self.transitionModel.presentImitate = PresentImitateFadeIn;
    self.transitionModel.dismissImitate = DismissAnimationFadeOut;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTransitionModels];
}

@end
