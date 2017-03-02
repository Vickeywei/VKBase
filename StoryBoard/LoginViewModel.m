//
//  LoginViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "LoginViewModel.h"
#import "SBServer.h"
#import "LoginModel.h"
@implementation LoginViewModel
- (RACSignal*)loginWithAccount:(NSString*)account passWord:(NSString*)passWord {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSDictionary *parameter = @{
                                    @"account":account,
                                    @"pwd":passWord
                                    };
        SBServer *server = [SBServer manager];
        [[server registWithParameter:parameter cmd:@"login" resultClass:[LoginModel class]] subscribeNext:^(id x) {
            [subscriber sendNext:x];
        } error:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}
@end
