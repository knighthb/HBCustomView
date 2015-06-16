//
//  HBTabBar.h
//  HBCustomView
//
//  Created by knight on 15/6/15.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HBTabBarItem;
@class HBBarButton;
@protocol HBTabBarDelegate <NSObject>
/**
 *  当button被按下时会产生的代理方法
 *
 *  @param button 被点中的按钮
 *  @param index  当前的按钮的位置
 */
@required
- (void)didSelectTabbarItem:(HBTabBarItem *) item atIndex:(NSInteger) index;

@end

@interface HBTabBar : UIView
@property (nonatomic , copy) NSArray * items;
@property (nonatomic , weak) id<HBTabBarDelegate> delegate;
@property (nonatomic , strong) NSMutableArray * tabBarButtons;

- (void) setItems:(NSArray *)items;
@end
