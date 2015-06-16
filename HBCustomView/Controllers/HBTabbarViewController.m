//
//  HBTabbarViewController.m
//  HBCustomView
//
//  Created by knight on 15/4/14.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import "HBTabbarViewController.h"
#import "HBBarButton.h"
#import "Define.h"
#import "HBTabBar.h"

NSInteger const kTabbarHeight = 49;
NSInteger const kNavHeight = 44;
NSInteger const kStatusBarHeight = 20;
NSString * const kBarBtnStateChanged = @"tabBarButtonStateChanged";
@implementation HBTabbarViewController

#pragma mark - init
- (id)initWithViewcontrollers:(NSMutableArray *) controllers
                  tabBarItems:(NSArray *) items
                     animated:(BOOL) animated {
    if (self = [super init]) {
        _animated = animated;
        _selectedIndex = 0;
        _tabBarItems = [[[NSArray alloc] initWithArray:items] copy];
        if ([[controllers objectAtIndex:_selectedIndex] isKindOfClass:[UIViewController class]]) {
            _currentController = [controllers objectAtIndex:_selectedIndex];
        }else{
            _currentController = nil;
        }
        for (UIViewController * vc in controllers) {
            [self addChildViewController:vc];
        }
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabbarHeight)];
        self.contentView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - lifeCycle
- (void) viewDidLoad{
    [super viewDidLoad];
    //默认显示展示第0个viewcontroller的view
    [self.contentView addSubview:self.currentController.view];
    [self.view addSubview:self.contentView];
    [self addTabBar];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    for (NSObject * item in _tabBar.items) {
        [[NSNotificationCenter defaultCenter] removeObserver:item forKeyPath:kBarBtnStateChanged];
    }
}

#pragma mark - private methods
//- (void)initTopBarWithColor:(UIColor *) color
//                           title:(NSString *) title{
//    _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavHeight+kStatusBarHeight)];
//    _topBar.backgroundColor = color;
//     _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_topBar.center.x-20, _topBar.center.y-10, 40, 20)];
//    _titleLabel.text = title;
//    _titleLabel.backgroundColor = color;
//    _titleLabel.textColor = [UIColor whiteColor];
//    [_topBar addSubview:_titleLabel];
//    [self.view addSubview:_topBar];
//}


- (void)addTabBar {
    _tabBar = [[HBTabBar alloc] initWithFrame:CGRectMake(0, kScreenHeight-kTabbarHeight, kScreenWidth, kTabbarHeight)];
    _tabBar.backgroundColor = [UIColor purpleColor];
    _tabBar.delegate = self;
    _tabBar.items = self.tabBarItems;
    [self.view addSubview:_tabBar];
}


#pragma mark - HBTabBarDelegate

- (void)didSelectTabbarItem:(HBTabBarItem *)item atIndex:(NSInteger)index {
    UIViewController * toVc = (UIViewController *)[self.childViewControllers objectAtIndex:index];
    __typeof (*&self) __weak weakSelf = self;
    [self transitionFromViewController:self.currentController toViewController:toVc duration:3.5 options:UIViewAnimationOptionCurveEaseInOut animations:nil completion:^(BOOL finished) {
        NSMutableDictionary * userInfo = [[NSMutableDictionary alloc] init];
        [userInfo setObject:[NSString stringWithFormat:@"%ld",weakSelf.selectedIndex] forKey:kPreviousBtn];
        weakSelf.selectedIndex = index;
        weakSelf.currentController = toVc;
        NSInteger currentIndex = index;
        NSNotification * notification = [[NSNotification alloc] initWithName:kBarBtnStateChanged object:[NSString stringWithFormat:@"%ld",currentIndex] userInfo:userInfo];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }];
}

#pragma mark - setters and getters


@end
