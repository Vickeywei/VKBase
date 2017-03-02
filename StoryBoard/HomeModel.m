//
//  HomeModel.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "HomeModel.h"
#import <IGListKit/IGListKit.h>
@interface HomeModel () <IGListDiffable>

@end
@implementation HomeModel
- (instancetype)initWithName:(NSString*)name viewController:(UIViewController *)vc identifier:(NSString *)identifier {
    if (self = [super init]) {
        self.name = name;
        self.viewController = vc;
        self.controllerIdentifier = identifier;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self.name;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    else  {
        HomeModel * model = (HomeModel *)object;
        return self.viewController == model.viewController && self.controllerIdentifier == model.controllerIdentifier;
    }
}
@end
