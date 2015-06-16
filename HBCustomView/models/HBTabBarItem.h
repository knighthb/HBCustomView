//
//  HBTabBarItem.h
//  HBCustomView
//
//  Created by knight on 15/4/16.
//  Copyright (c) 2015年 knight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HBBarButton;

typedef enum {
    TabItemEnable,
    TabItemDisable
} TabItemState;

@interface HBTabBarItem : UIView{

}
@property (nonatomic, assign) TabItemState state;
@property (nonatomic, strong) UIImage * selectedImg;
@property (nonatomic, strong) UIImage * unSelectedImg;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) HBBarButton * button;

- (instancetype)initWithSelectedImg:(UIImage *) enableImg
                      unSelectedImg:(UIImage *) disableImg
                              title:(NSString *) title;


@end
