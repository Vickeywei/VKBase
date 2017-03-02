//
//  SBMainViewController.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SBMainViewController.h"
#import <WQmacro.h>
#import "TabbarViewModel.h"
#import "SiteModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIView+Toast.h"
#import "NSString+Width.m"

@interface SBMainViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) UIImageView *lanchImage;
@property (nonatomic, strong)  SiteModel*siteModel;

@end

@implementation SBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *imageName = @"LaunchImage";
    if (SCREEEN_HEIGHT <= 480) {
        imageName = @"";
    } else if (SCREEEN_HEIGHT <= 568) {
        imageName = @"LaunchImage-700-568h";
    } else if (SCREEEN_HEIGHT <= 667) {
        imageName = @"LaunchImage-800-667h";
    } else {
        imageName = @"LaunchImage-800-Portrait-736h";
        
    }
    self.lanchImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    self.lanchImage.frame = [UIScreen mainScreen].bounds;
    self.tabBar.tintColor = [UIColor redColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    [[[UIApplication sharedApplication].delegate window] addSubview:self.lanchImage];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    @weakify(self);
    [[TabbarViewModel qrySiteInfo]subscribeNext:^(SiteModel* x) {
        @strongify(self);
        self.siteModel = x;
        if (self.siteModel) {
            if (self.lanchImage) {
                [self.lanchImage removeFromSuperview];
                self.lanchImage = nil;
            }
        }
    } error:^(NSError *error) {
        NSString *localizedDescription = error.localizedDescription;
        CGPoint point = CGPointMake([[UIApplication sharedApplication].delegate window].center.x, [[UIApplication sharedApplication].delegate window].center.y);
        NSValue *value = [NSValue valueWithCGPoint:point];
        [[[UIApplication sharedApplication].delegate window]makeToast:localizedDescription duration:1 position:value];
        
        if (self.lanchImage) {
            [self.lanchImage removeFromSuperview];
            self.lanchImage = nil;
        }
        
    }];
}


#pragma mark - UINavigationBarDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationController.delegate = nil;
    }
    
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
