//
//  HBTabbarViewController.h
//  HBCustomView
//
//  Created by knight on 15/4/14.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HBTabBar.h"
//@protocol HBTabbarViewControllerDelegate <NSObject>
//
//- ()
//
//@end
@class HBTabBar;
@interface HBTabbarViewController : UIViewController<HBTabBarDelegate>
{
    UIView * _topBar;
    HBTabBar * _tabBar;
}
//@property (nonatomic, strong) NSMutableArray * viewControllers;
@property (nonatomic, strong) UIViewController * currentController;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, copy  ) NSArray * tabBarItems;
- (id)initWithViewcontrollers:(NSMutableArray *) controllers
                  tabBarItems:(NSArray *) items
                     animated:(BOOL) animated;

@end
