//
//  FTNavigationBar.m
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTNavigationBar.h"
#import "FTToolMacros.h"
#import "UIView+FTExtension.h"

@interface FTNavigationBar ()

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *largeTitleLabel;

@property (weak, nonatomic) IBOutlet UIView *titleViewWrapper;

@end

@implementation FTNavigationBar

+ (instancetype)navigationBar {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self)
                                         owner:nil
                                       options:nil].lastObject;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    if (title) {
        self.titleLabel.hidden = NO;
        self.titleLabel.text = title;
    } else {
        self.titleLabel.hidden = YES;
    }
}

- (void)setLargeTitle:(NSString *)largeTitle {
    _largeTitle = largeTitle;
    
    self.largeTitleLabel.text = largeTitle;
}

- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    
    if (rightTitle) {
        self.rightBtn.hidden = NO;
        [self.rightBtn setTitle:rightTitle
                       forState:UIControlStateNormal];
    } else {
        self.rightBtn.hidden = YES;
    }
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    
    self.titleLabel.hidden = YES;
    [self.titleViewWrapper addSubview:titleView];
    titleView.center = self.titleLabel.center;
}

- (void)setLargeTitleScrollView:(UIScrollView *)largeTitleScrollView {
    
    if (_largeTitleScrollView != largeTitleScrollView) {
        [_largeTitleScrollView removeObserver:self
                                  forKeyPath:@"contentOffset"];
        [_largeTitleScrollView.panGestureRecognizer removeObserver:self
                                                        forKeyPath:@"state"];
        
        if (largeTitleScrollView) {
            [largeTitleScrollView addObserver:self
                                   forKeyPath:@"contentOffset"
                                      options:NSKeyValueObservingOptionNew
                                      context:nil];
            [largeTitleScrollView.panGestureRecognizer addObserver:self
                                   forKeyPath:@"state"  // 改成scrollView停止滚动时
                                      options:NSKeyValueObservingOptionNew
                                      context:nil];
        }
        // else 暂不考虑恢复导航栏
        _largeTitleScrollView = largeTitleScrollView;
    }
}

- (IBAction)rightBtnClick:(UIButton *)sender {
    [self.delegate navigationBarDidClickRightButton:self];
}

- (void)updateLargeTitleViewOffsetY:(CGFloat)offsetY {
    
    CGFloat height = 64 - offsetY;
    
    if (height < 64) {
        height = 64;    // 64是导航栏，暂时写死
    }
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    
    if (offsetY < 0) {  // 44是大标题的内容高度，暂时写死
        if (offsetY < -44) {
            offsetY = -44;
        }
        self.largeTitleScrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, 0, 0);
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self updateLargeTitleViewOffsetY:[change[NSKeyValueChangeNewKey] CGPointValue].y];
    } else if ([keyPath isEqualToString:@"state"]) {
        if ([change[NSKeyValueChangeNewKey] integerValue] == UIGestureRecognizerStateEnded) {
            // 判断大标题所占多少
            if (self.ft_sizeH > 64 + 22) {
                // 全部展示
                [self.largeTitleScrollView setContentOffset:CGPointMake(0, -44)
                                                   animated:YES];
            } else if (self.ft_sizeH > 64) {
                // 隐藏
                [self.largeTitleScrollView setContentOffset:CGPointZero
                                                   animated:YES];
            }
        }
    }
}


- (void)dealloc {
    [self.largeTitleScrollView removeObserver:self
                                   forKeyPath:@"contentOffset"];
    [self.largeTitleScrollView.panGestureRecognizer removeObserver:self
                                                        forKeyPath:@"state"];
}
@end
