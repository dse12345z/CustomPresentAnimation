//
//  AppDelegate.m
//  CustomPresentAnimation
//
//  Created by AllenShiu on 2016/8/19.
//  Copyright © 2016年 AllenShiu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [MainViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
