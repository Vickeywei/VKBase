//
//  SBBannerModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Realm/Realm.h>
#import "UtilityMacro.h"
@interface SBBannerModel : RLMObject
@property long identifier;
@property NSString* title;
@property NSString* coverImg;
@property NSString* htmlUrl;
@property NSInteger pagePosition;
@property NSString* targetModuleCode;
@property long targetId;
@property NSInteger orderNum;
@property KResType resType;
@property KType secondType;
@property KClintShowType showType;
@property KClientOSType clientOs;
@property NSInteger versionCode;
@end
