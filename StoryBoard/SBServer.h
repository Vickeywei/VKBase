//
//  SBServer.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SiteModel.h"
@interface SBServer : AFHTTPSessionManager
@property (nonatomic, strong) NSString *siteId;
@property (nonatomic, assign) long userId;
@property (nonatomic, strong) NSString *appToken;
@property (nonatomic, strong)SiteModel* currentSite;

- (RACSignal *)registWithParameter:(NSDictionary *)parameter cmd:(NSString *)cmd resultClass:(Class)resultClass;
    
@end
