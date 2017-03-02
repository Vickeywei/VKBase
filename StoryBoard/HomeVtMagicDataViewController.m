//
//  HomeVtMagicDataViewController.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeVtMagicDataViewController.h"
#import "VTMagic.h"
#import "SiteNavigationViewModel.h"
#import "SiteNavigationModel.h"
#import "HomeSelectViewController.h"
#import "HomeClassificationViewController.h"
#import "HomeRankingViewController.h"
#import "SiteNavigationManager.h"
@interface HomeVtMagicDataViewController ()<VTMagicViewDataSource,VTMagicViewDelegate>
@property (nonatomic, strong) SiteNavigationViewModel *siteNavigationViewModel;
@property (nonatomic, strong) SiteNavigationModel *navigationModel;
@property (nonatomic, strong) NSArray *menuArray;
@end

@implementation HomeVtMagicDataViewController

- (RACSignal *)requestData {
    
    NSMutableArray *vtMagicMenu = @[].mutableCopy;
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        self.siteNavigationViewModel = [[SiteNavigationViewModel alloc] init];
        [[self.siteNavigationViewModel qrySiteNavListWithIsDiscoveryShow:2]subscribeNext:^(id x) {
            if ([x isKindOfClass:[NSArray class]]) {
                NSArray *array = x;
                for (SiteNavigationModel *model in array) {
                    if (!([model.name isEqualToString:@"分站"] || [model.name isEqualToString:@"发现"])) {
                        if ([model.name isEqualToString:@"首页"]) {
                            [SiteNavigationManager shareInstance].navigationId = model.navigationId;
                        }
                        [vtMagicMenu addObject:model.name];
                    }
                }
                self.menuArray = vtMagicMenu.copy;
                [subscriber sendNext:vtMagicMenu];
                
                [subscriber sendCompleted];
                
            }
            else if ([x isKindOfClass:[SiteNavigationModel class]]){
                [subscriber sendNext:x];
                [subscriber sendCompleted];
            }
        } error:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;

    
}

- (NSArray *)menuArray {
    if (!_menuArray) {
        _menuArray = @[];
    }
    return _menuArray;
}

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return _menuArray;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16.f];
    }
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    if (0 == pageIndex) {
        static NSString *recomId = @"homeSelect";
        HomeSelectViewController *selecViewController = [magicView dequeueReusablePageWithIdentifier:recomId];
        if (!selecViewController) {
            selecViewController = [[HomeSelectViewController alloc] init];
        }
        return selecViewController;
    }
    
    if (1 == pageIndex) {
        static NSString *recomId = @"homeClassification";
        HomeClassificationViewController *homeClassification = [magicView dequeueReusablePageWithIdentifier:recomId];
        if (!homeClassification) {
            homeClassification = [[HomeClassificationViewController alloc] init];
        }
        return homeClassification;
    }
    if (2 == pageIndex) {
        static NSString *recomId = @"homeRanking";
        HomeRankingViewController *homeRankingViewController = [magicView dequeueReusablePageWithIdentifier:recomId];
        if (!homeRankingViewController) {
            homeRankingViewController = [[HomeRankingViewController alloc] init];
        }
        return homeRankingViewController;
    }
    UIViewController *vc = [[UIViewController alloc] init];
    return vc;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
