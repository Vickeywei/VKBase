//
//  LoginViewModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface LoginViewModel : NSObject
- (RACSignal*)loginWithAccount:(NSString*)account passWord:(NSString*)passWord ;
    
@end
