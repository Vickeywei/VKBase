//
//  HomeViewController.m
//  StoryBoard
//
//
//  HomeViewController.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/14.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeViewController.h"
#import <WQmacro.h>

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VTMagic.h"
#import "HomeVtMagicDataViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) VTMagicController *magicController;
@property (nonatomic, strong) HomeVtMagicDataViewController *dataViewController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self addChildViewController:self.magicController];
    [self.view addSubview:_magicController.view];
    _dataViewController = [[HomeVtMagicDataViewController alloc] init];
    self.magicController.magicView.delegate = (id <VTMagicViewDelegate>) _dataViewController;
    self.magicController.magicView.dataSource = (id <VTMagicViewDataSource>)_dataViewController;
    [[_dataViewController requestData]subscribeNext:^(id x) {
        if (x && [x isKindOfClass:[NSArray class]]) {
            [_magicController.magicView reloadData];
        }
    } error:^(NSError *error) {
        
    }];
}

- (VTMagicController *)magicController
{
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.magicView.frame = CGRectMake(0,64,SCREEN_WIDTH,SCREEEN_HEIGHT);
        
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.sliderColor = [UIColor redColor];
        _magicController.magicView.layoutStyle = VTLayoutStyleDivide;
        _magicController.magicView.sliderStyle = VTSliderStyleDefault;
        _magicController.magicView.navigationHeight = 40.f;
        _magicController.magicView.headerHeight = 30;
        _magicController.magicView.sliderColor = [UIColor redColor];
        
    }
    return _magicController;
}

@end
