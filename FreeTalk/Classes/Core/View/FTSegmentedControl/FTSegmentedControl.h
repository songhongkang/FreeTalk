//
//  FTSegmentedControl.h
//  FreeTalk
//
//  Created by wsong on 2018/4/7.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTSegmentedControl;

@protocol FTSegmentedControlDelegate <NSObject>

@optional
/** segmentControl选中时调用 */
- (void)segmentedControl:(FTSegmentedControl *)segmentedControl
             didSelected:(NSInteger)selectedIndex;

@end

@interface FTSegmentedControl : UIView

/** 选中的索引，默认为0 */
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, weak) id<FTSegmentedControlDelegate> delegate;
/** 主题色，边框与被选中颜色 */
@property (nonatomic, strong) UIColor *themeColor;
/** 字体 */
@property (nonatomic, strong) UIFont *font;

/**
 快速创建FTSegmentedControl

 @param items FTSegmentedControl显示的文字
 @return FTSegmentedControl
 */
- (instancetype)initWithItems:(NSArray<NSString *> *)items;

@end
