//
//  SiteNavigationManager.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SiteNavigationManager : NSObject
+ (instancetype)shareInstance;
@property (nonatomic, assign) NSInteger navigationId;

@end
