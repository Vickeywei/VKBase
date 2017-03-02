//
//  HomeViewModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>
#import <UIKit/UIKit.h>
@interface HomeViewModel : NSObject
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) IGListAdapterUpdater *updater;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIViewController *homeViewController;
@end
