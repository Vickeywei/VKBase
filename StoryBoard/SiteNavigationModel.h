//
//  SiteNavigationModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SiteNavigationModel : NSObject
@property (nonatomic, assign) NSInteger navRelationId;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) NSInteger hasBanner;
@property (nonatomic, strong) NSString* alias;
@property (nonatomic, assign) NSInteger isDiscoveryShow;
@property (nonatomic, assign) NSInteger isExternalUrl;
@property (nonatomic, strong) NSString* openUrl;
@property (nonatomic, strong) NSString* openExternalUrl;
@property (nonatomic, strong) NSString* iconUrl;
@property (nonatomic, strong) NSString* siteIconUrl;
@property (nonatomic, assign) NSInteger sortNum;
@property (nonatomic, assign) NSInteger hasColumn;//是否支持栏目,1=是 2=否 如分站是没有栏目配置
@property (nonatomic, assign) long navigationId;//导航Id
@end
