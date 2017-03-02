//
//  HomeDemoSectionController.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeDemoSectionController.h"
#import "HomeCollectionViewCell.h"
@implementation HomeDemoSectionController
- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 200);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    HomeCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[HomeCollectionViewCell class] forSectionController:self atIndex:index];
    cell.imageDatasources = self.bannerImage;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.bannerImage = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController <IGListSectionType> *)sectionController{
    
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController <IGListSectionType> *)sectionController {
    
}
@end
