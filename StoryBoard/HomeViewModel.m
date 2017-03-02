//
//  HomeViewModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeDemoSectionController.h"
#import "HomeModel.h"
#import <WQmacro.h>
@interface HomeViewModel ()<IGListAdapterDataSource>

@end

@implementation HomeViewModel


- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:self.updater viewController:self.homeViewController workingRangeSize:0];
        _adapter.dataSource = self;
    }
    return _adapter;
}

- (IGListAdapterUpdater *)updater {
    if (!_updater) {
        _updater = [[IGListAdapterUpdater alloc] init];
    }
    return _updater;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataSource;
}

- (IGListSectionController <IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    HomeDemoSectionController* sectionViewController = [[HomeDemoSectionController alloc] init];
    sectionViewController.bannerImage = object;
    return sectionViewController;
}
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}
@end
