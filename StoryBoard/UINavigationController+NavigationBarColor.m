//
//  UINavigationController+NavigationBarColor.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/17.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "UINavigationController+NavigationBarColor.h"
#import "UIColor+Hex.h"
#import <WQmacro.h>
#import "UIImage+Color.h"
@implementation UINavigationController (NavigationBarColor)
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithSolidColor:WQHEXColor(0xFC0C1B) size:CGSizeMake(SCREEN_WIDTH, 64)] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithSolidColor:WQRGBColor(206, 209, 217) size:CGSizeMake(SCREEN_WIDTH, 0.5)]];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextAttributes = @{
                                                         NSForegroundColorAttributeName: [UIColor whiteColor],
                                                         NSFontAttributeName: [UIFont systemFontOfSize:18],
                                                         };
    
}
@end
