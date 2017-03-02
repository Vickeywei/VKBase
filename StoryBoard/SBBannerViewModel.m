//
//  SBBannerViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SBBannerViewModel.h"
#import "SBServer.h"
#import "SBBannerModel.h"
@implementation SBBannerViewModel
- (RACSignal *)qryBannerListWithNavId:(long)navId showType:(NSInteger)showType clientOs:(NSInteger)clientOs versionCode:(NSInteger)versionCode {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableDictionary *dic = @{
                                     @"navId":@(navId),
                                     }.mutableCopy;
        if (showType) {
            [dic setObject:@(showType) forKey:@"showType"];
        }
        if (clientOs) {
            [dic setObject:@(clientOs) forKey:@"clientOs"];
        }
        if (versionCode) {
            [dic setObject:@(versionCode) forKey:@"versionCode"];
        }
        
        [[[SBServer manager] registWithParameter:dic.copy cmd:@"qryBannerList" resultClass:[SBBannerModel class]]subscribeNext:^(id x) {
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        } error:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}
@end
