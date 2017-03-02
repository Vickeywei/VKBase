//
//  RegisterViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "RegisterViewModel.h"
#import "SBServer.h"
#import "RegisModel.h"
@implementation RegisterViewModel
- (RACSignal *)registerUserAccount:(NSString*)account
                             phone:(NSString*)phone
                               pwd:(NSString*)pwd
                        confirmPwd:(NSString*)confirmPwd
                      validateCode:(NSString*)validateCode
                            uaInfo:(NSString*)uaInfo {
    SBServer *server = [SBServer manager];
    NSDictionary *parameter = @{
                                @"account":account,
                                @"phone":phone,
                                @"pwd":pwd,
                                @"confirmPwd":confirmPwd,
                                @"validateCode":validateCode,
                                @"uaInfo":uaInfo
                                };
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[server registWithParameter:parameter cmd:@"register" resultClass:[RegisModel class]]subscribeNext:^(id x) {
            
        } error:^(NSError *error) {
            
        }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}
    
@end
