//
//  SBBannerViewModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface SBBannerViewModel : NSObject
- (RACSignal *)qryBannerListWithNavId:(long)navId showType:(NSInteger)showType clientOs:(NSInteger)clientOs versionCode:(NSInteger)versionCode;

@end
