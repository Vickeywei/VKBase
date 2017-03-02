//
//  SiteNavigationModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SiteNavigationModel.h"

@implementation SiteNavigationModel
- (void)setNavigationArray:(NSArray *)navigationArray {
    for (SiteNavigationModel *model in navigationArray) {
        NSLog(@"%@",model);
    }
}



@end
