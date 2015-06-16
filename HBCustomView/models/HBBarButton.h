//
//  HBBarButton.h
//  HBCustomView
//
//  Created by knight on 15/4/16.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HBTabBarItem;
#define kPreviousBtn @"previousBtn"

typedef enum {
    TabItemUnSelected,
    TabItemSelected
} TabButtonState;
@interface HBBarButton : UIButton
@property (nonatomic, readwrite, assign) TabButtonState btnState;
@property (nonatomic, strong)HBTabBarItem * item;

- (void)btnStateDidChanged:(NSNotification *) noticifation;
@end
