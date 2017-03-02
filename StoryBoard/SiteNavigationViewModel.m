//
//  SiteNavigationViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SiteNavigationViewModel.h"
#import "SiteNavigationModel.h"
@implementation SiteNavigationViewModel
- (RACSignal *)qrySiteNavListWithIsDiscoveryShow:(NSInteger)isDiscoveryShow {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary *dic = @{
                              @"isDiscoveryShow" :@(isDiscoveryShow)
                              };
        SBServer *server = [SBServer manager];
        [[server registWithParameter:dic cmd:@"qrySiteNavList" resultClass:[SiteNavigationModel class]]subscribeNext:^(id x) {
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
