//
//  TabbarViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "TabbarViewModel.h"
#import "SiteModel.h"
@implementation TabbarViewModel
+ (RACSignal *)qrySiteInfo {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        SBServer *server = [SBServer manager];
        [[server registWithParameter:nil cmd:@"qrySiteInfo" resultClass:[SiteModel class]] subscribeNext:^(id x) {
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
