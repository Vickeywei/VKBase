//
//  HomeCollectionViewCell.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "StoryBoard-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface HomeCollectionViewCell ()<FSPagerViewDelegate,FSPagerViewDataSource>
@property (nonatomic, strong) FSPagerView*pagerView;



@end
@implementation HomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        if (!_pagerView) {
           _pagerView = [[FSPagerView alloc] initWithFrame:frame];
            _pagerView.delegate = self;
            _pagerView.dataSource = self;
            [_pagerView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
            [self.contentView addSubview:_pagerView];
        }
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (NSInteger)numberOfItemsInpagerView:(FSPagerView *)pagerView
{
    return 1;
}

- (FSPagerViewCell *)pagerView:(FSPagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    FSPagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cell" atIndex:index];
    NSURL *url = [NSURL URLWithString:self.imageDatasources];
    [cell.imageView sd_setImageWithURL:url];
    return cell;
}

@end
