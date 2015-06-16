//
//  HBTabBarItem.m
//  HBCustomView
//
//  Created by knight on 15/4/16.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import "HBTabBarItem.h"
#import "HBBarButton.h"
#import "Define.h"

@implementation HBTabBarItem

#pragma mark - init
- (instancetype)initWithSelectedImg:(UIImage *) enableImg unSelectedImg:(UIImage *) disableImg title:(NSString *)title {
    if (self = [super init]) {
        _selectedImg = enableImg;
        _unSelectedImg = disableImg;
        _title = title;
        _state = TabItemDisable;
    }
    return self;
}

#pragma mark - actions & notifications
- (void)btnStateDidChanged:(NSNotification *) noticifation{
    if (noticifation && [kBarBtnStateChanged isEqualToString:noticifation.name]) {
        NSDictionary * userinfos = noticifation.userInfo;
        NSInteger currentIndex = [noticifation.object integerValue];
        NSInteger previousIndex = [[userinfos objectForKey:kPreviousBtn] integerValue];
        if (self.button.tag == previousIndex) {
            self.button.btnState = TabItemUnSelected;
            [self.button setImage:self.unSelectedImg forState:UIControlStateNormal];
        }else if (self.button.tag == currentIndex) {
            self.button.btnState = TabItemSelected;
            [self.button setImage:self.selectedImg forState:UIControlStateNormal];
        }
    }
}

@end
