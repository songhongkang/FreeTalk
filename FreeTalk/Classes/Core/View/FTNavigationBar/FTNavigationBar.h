//
//  FTNavigationBar.h
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTNavigationBar;

@protocol FTNavigationBarDelegate <NSObject>

/** 点击右边按钮触发 */
- (void)navigationBarDidClickRightButton:(FTNavigationBar *)navigationBar;

@end

@interface FTNavigationBar : UIView

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *largeTitle;

@property (nonatomic, copy) NSString *rightTitle;

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, weak) UIScrollView *largeTitleScrollView;

@property (nonatomic, weak) id<FTNavigationBarDelegate> delegate;

+ (instancetype)navigationBar;

@end
