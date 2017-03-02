//
//  HomeSelectViewController.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeSelectViewController.h"
#import "HomeViewModel.h"
#import "HomeModel.h"
#import "HomeView.h"
#import "SBServer.h"
#import "SBBannerModel.h"
#import "SBBannerViewModel.h"
#import "SiteNavigationManager.h"
@interface HomeSelectViewController ()
@property (nonatomic, strong) HomeView *homeView;
@property (nonatomic, strong) HomeViewModel *homeViewModel;
@property (nonatomic, strong) SBBannerViewModel *bannerViewModel;
@end

@implementation HomeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.bannerViewModel = [[SBBannerViewModel alloc] init];
    [[self.bannerViewModel qryBannerListWithNavId:[SiteNavigationManager shareInstance].navigationId showType:0 clientOs:0 versionCode:0]subscribeNext:^(id x) {
        NSMutableArray *array = @[].mutableCopy;
        if ([x isKindOfClass:[NSArray class]]) {
            for (SBBannerModel *model in x) {
                [array addObject:model.coverImg];
                [array addObject:model.coverImg];
                [array addObject:model.coverImg];
                [array addObject:model.coverImg];
                [array addObject:model.coverImg];
            }
        }
        self.homeView = [[HomeView alloc] initWithFrame:self.view.bounds];
        self.homeViewModel = [[HomeViewModel alloc] init];
        self.homeViewModel.dataSource = array.copy;
        self.homeViewModel.homeViewController = self;
        self.homeViewModel.adapter.collectionView = self.homeView.collectionView;
        [self.view addSubview:self.homeView];
    } error:^(NSError *error) {
        
    }];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
