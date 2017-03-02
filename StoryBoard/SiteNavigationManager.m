//
//  SiteNavigationManager.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SiteNavigationManager.h"

@implementation SiteNavigationManager
+ (instancetype)shareInstance {
    static SiteNavigationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SiteNavigationManager alloc] init];
    });
    return manager;
}
@end
