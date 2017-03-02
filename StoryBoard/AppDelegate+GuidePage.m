//
//  AppDelegate+GuidePage.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "AppDelegate+GuidePage.h"
#import <objc/runtime.h>
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"
#import "UtilityMacro.h"
const  NSString  *firstLanch = @"firstLanch";
@implementation AppDelegate (GuidePage)
+ (void)load {
    Method applicationLanch = class_getInstanceMethod([self class],@selector(application: didFinishLaunchingWithOptions:));
    Method newApplicationLanch = class_getInstanceMethod([self class], @selector(newApplication: didFinishLaunchingWithOptions:));
    method_exchangeImplementations(applicationLanch, newApplicationLanch);
}
- (BOOL)newApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = [self newApplication:application didFinishLaunchingWithOptions:launchOptions];
    // Override point for customization after application launch.
    if (![[NSUserDefaults standardUserDefaults] objectForKey:firstLanch]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:firstLanch];
        OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:nil body:nil image:[UIImage imageNamed:@"guide1"] buttonText:nil action:nil];
        firstPage.topPadding = 0;
        OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:nil body:nil image:[UIImage imageNamed:@"guide2"] buttonText:nil action:nil];
        secondPage.movesToNextViewController = YES;
        secondPage.topPadding = 0;
        secondPage.viewDidAppearBlock = ^{
            NSLog(@"second Page");
        };
        OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:nil body:nil image:[UIImage imageNamed:@"guide3"] buttonText:@"Get Started" action:^{
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            self.window.rootViewController = story.instantiateInitialViewController;
        }];
        [thirdPage.actionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        thirdPage.topPadding = 0;
        thirdPage.viewDidAppearBlock = ^{
            NSLog(@"third Page");
        };
        OnboardingViewController*onboardingVC=[OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@""]contents:@[firstPage,secondPage,thirdPage]];
        [onboardingVC.skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        onboardingVC.shouldFadeTransitions = YES;
        onboardingVC.fadePageControlOnLastPage = YES;
        onboardingVC.fadeSkipButtonOnLastPage = YES;
        onboardingVC.allowSkipping = YES;
        onboardingVC.skipHandler = ^{
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            self.window.rootViewController = story.instantiateInitialViewController;
        };
        self.window.rootViewController = onboardingVC;
    }
    else {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = story.instantiateInitialViewController;
    }
   
    return result;
}
    
@end
