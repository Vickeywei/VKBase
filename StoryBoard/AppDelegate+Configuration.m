//
//  AppDelegate+Configuration.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "AppDelegate+Configuration.h"
#import <objc/runtime.h>
@implementation AppDelegate (Configuration)
+ (void)load {
    Method applicationLanch = class_getInstanceMethod([self class],@selector(application: didFinishLaunchingWithOptions:));
    Method newApplicationLanch = class_getInstanceMethod([self class], @selector(configurationApplication: didFinishLaunchingWithOptions:));
    method_exchangeImplementations(applicationLanch, newApplicationLanch);
}
- (BOOL)configurationApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = [self configurationApplication:application didFinishLaunchingWithOptions:launchOptions];
    NSLog(@"这里可以注册微信支付、支付宝、地图、分享、推送、蒲公英等");
    return result;
}
@end
