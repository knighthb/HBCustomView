//
//  HBTabBar.m
//  HBCustomView
//
//  Created by knight on 15/6/15.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import "HBTabBar.h"
#import "HBTabBarItem.h"
#import "HBBarButton.h"
#import "Define.h"

@interface HBTabBar ()
@property (nonatomic , assign) NSInteger selectedIndex;
@end

@implementation HBTabBar

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectedIndex = 0;
        _delegate = nil;
        _tabBarButtons = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectedIndex = 0;
        _delegate = nil;
        _tabBarButtons = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark - pravite methods
- (void)setUpBarbuttonsWith:(NSArray *) items {
    NSInteger index = 0;
    NSInteger count = [items count];
    for (HBTabBarItem * item in items) {
        HBBarButton * barButton = [[HBBarButton alloc] initWithFrame:CGRectMake(index*kScreenWidth/count, 0, kScreenWidth/count, kTabbarHeight)];
        barButton.tag = index;
        [barButton setTitle:item.title forState:UIControlStateNormal];
        if (index == self.selectedIndex) {
            [barButton setImage:item.selectedImg forState:UIControlStateNormal];
            [barButton setImage:item.unSelectedImg forState:UIControlStateHighlighted];
            barButton.btnState = TabItemSelected;
        }else {
            [barButton setImage:item.unSelectedImg forState:UIControlStateNormal];
            [barButton setImage:item.selectedImg forState:UIControlStateHighlighted];
            barButton.btnState = TabItemUnSelected;
        }
        barButton.titleEdgeInsets =  UIEdgeInsetsMake(25, -10, 1, 25);
        barButton.imageEdgeInsets = UIEdgeInsetsMake(5, 20, 20, 10);
        barButton.titleLabel.font = [UIFont systemFontOfSize:9.0f];
        [barButton addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
        [[NSNotificationCenter defaultCenter] addObserver:item selector:@selector(btnStateDidChanged:) name:kBarBtnStateChanged object:nil];
        [self.tabBarButtons addObject:barButton];
        item.button = barButton;
        index++;
    }
}

#pragma mark - actions & notifications
- (IBAction)didClicked:(id)sender {
    if ([sender isKindOfClass:[HBBarButton class]]) {
        HBBarButton * barButton = (HBBarButton *) sender;
        if (barButton.tag == self.selectedIndex) {
            return;
        }
        self.selectedIndex = barButton.tag;
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectTabbarItem:atIndex:)]) {
           [self.delegate didSelectTabbarItem:self.items[self.selectedIndex] atIndex:self.selectedIndex];
        }
    }
}

#pragma mark - setters and getters
- (void) setItems:(NSArray *)items {
    if (!_items) {
        _items = [[[NSArray alloc] initWithArray:items] copy];
    }
    _items = [items copy];
    for (UIView * view in self.subviews) {
        [view removeFromSuperview];
    }
   [self setUpBarbuttonsWith:items];
    for (HBBarButton * btn in self.tabBarButtons) {
        [self addSubview:btn];
    }
}


@end
