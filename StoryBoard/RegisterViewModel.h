//
//  RegisterViewModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface RegisterViewModel : NSObject
- (RACSignal *)registerUserAccount:(NSString*)account
                                 phone:(NSString*)phone
                                   pwd:(NSString*)pwd
                            confirmPwd:(NSString*)confirmPwd
                          validateCode:(NSString*)validateCode
                            uaInfo:(NSString*)uaInfo;
    
@end
