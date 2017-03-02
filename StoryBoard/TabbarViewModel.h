//
//  TabbarViewModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBServer.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface TabbarViewModel : NSObject
+ (RACSignal *)qrySiteInfo;

@end
