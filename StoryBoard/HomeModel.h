//
//  HomeModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HomeModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) NSString *controllerIdentifier;
- (instancetype)initWithName:(NSString*)name viewController:(UIViewController *)vc identifier:(NSString *)identifier;
@end
