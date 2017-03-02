//
//  LoginModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"
@interface LoginModel : RLMObject
@property NSString *account;
@property NSString *appToken;
@property NSString *headImg;
@property NSString *isRealName;
@property NSString *libraryNo;
@property NSString *name;
@property NSString *phone;
@property NSString *siteId;
@property long userId;
@end
