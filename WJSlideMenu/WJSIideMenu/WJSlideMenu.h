//
//  WJSlideMenu.h
//  WJSlideMenu
//  https://github.com/wjTime
//  Created by 高文杰 on 16/3/6.
//  Copyright © 2016年 高文杰. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WJLeftMenuView.h"
//#import "WJRightMenuView.h"

@interface WJSlideMenu : UIView

@property (nonatomic,weak)UIButton *navLeftBtn;
@property (nonatomic,weak)UIButton *navRigthBtn;
@property (nonatomic,weak)UIView *titleView;

@property (nonatomic,weak)UIView *mainView;
@property (nonatomic,weak)UIView *navBgView;

//@property (nonatomic,weak)WJLeftMenuView *leftMenuView;
@property (nonatomic,weak)UIView *leftMenuView;
//@property (nonatomic,weak)WJRightMenuView *rightMenuView;
@property (nonatomic,weak)UIView *rightMenuView;

@property (nonatomic,assign)CGFloat leftMovex;
@property (nonatomic,assign)CGFloat rightMovex;


/**
 * close left menu
 */
- (void)closeLeftMenuView;

/**
 * close right menu
 */
- (void)closeRightMenuView;

/**
 * add SwipeGesture
 */
- (void)addSwipeGesture;


@end
