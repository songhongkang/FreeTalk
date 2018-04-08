//
//  FTSegmentedControl.m
//  FreeTalk
//
//  Created by wsong on 2018/4/7.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTSegmentedControl.h"
#import "UIView+FTExtension.h"
#import "UIImage+FTExtension.h"
#import "FTSegmentedButton.h"
#import "FTToolMacros.h"

/** FTSegmentedControl固定高度 */
#define FT_SEGMENTED_CONTROL_HEIGHT 26

#define FT_SEGMENTED_TAG_BASE 1000

@interface FTSegmentedControl ()

@property (nonatomic, strong) NSArray<NSString *> *items;

@property (nonatomic, assign) FTSegmentedButton *selectedButton;

@end

@implementation FTSegmentedControl

@synthesize font = _font;

// 快速创建FTSegmentedControl
- (instancetype)initWithItems:(NSArray<NSString *> *)items {
    if (self = [super init]) {
        self.items = items;
        self.selectedIndex = 0;
        self.ft_cornerRadius = FT_SEGMENTED_CONTROL_HEIGHT * 0.5;
        self.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

#pragma mark - Private
- (CGFloat)fitWidth {
    
    CGFloat maxWidth = 0;
    
    for (NSString *item in self.items) {
        CGFloat width = [item boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : self.font}
                                           context:nil].size.width;
        if (width > maxWidth) {
            maxWidth = width;
        }
    }
    return (maxWidth + FT_SEGMENTED_CONTROL_HEIGHT) * self.items.count;
}

- (void)segmentedButtonClick:(FTSegmentedButton *)button {
    // 重复点击无效
    if (button == self.selectedButton) return;
    
    button.selected = YES;
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    _selectedIndex = button.tag - FT_SEGMENTED_TAG_BASE;
    
    if ([self.delegate respondsToSelector:@selector(segmentedControl:didSelected:)]) {
        [self.delegate segmentedControl:self
                            didSelected:_selectedIndex];
    }
}

#pragma mark - Setter/Getter
- (void)setFrame:(CGRect)frame {
    frame.size.height = FT_SEGMENTED_CONTROL_HEIGHT;
    [super setFrame:frame];
}

- (void)setThemeColor:(UIColor *)themeColor {
    _themeColor = themeColor;
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = themeColor.CGColor;
    
    for (FTSegmentedButton *button in self.subviews) {
        [button setTitleColor:themeColor
                     forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage ft_imageWithColor:themeColor]
                          forState:UIControlStateSelected];
    }
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.ft_sizeW = [self fitWidth];
}

- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (NSInteger i = 0; i < items.count; i++) {
        
        FTSegmentedButton *button = [FTSegmentedButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = FT_SEGMENTED_TAG_BASE + i;
        [button setTitle:items[i]
                forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor]
                     forState:UIControlStateSelected];
        [button addTarget:self
                   action:@selector(segmentedButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)setFt_sizeW:(CGFloat)ft_sizeW {
    [super setFt_sizeW:ft_sizeW];
    
    CGFloat buttonW = ft_sizeW / self.subviews.count;
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        
        FTSegmentedButton *button = self.subviews[i];
        
        button.titleLabel.font = self.font;
        button.frame = CGRectMake(i * buttonW, 0, buttonW, FT_SEGMENTED_CONTROL_HEIGHT);
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    [self segmentedButtonClick:self.subviews[selectedIndex]];
}

@end
