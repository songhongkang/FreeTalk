//
//  FTSelectedCell.m
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTSelectedCell.h"
#import "FTSelectedCellItem.h"
#import "FTToolMacros.h"

@interface FTSelectedCell ()

@property (nonatomic, weak) UIView *selectedView;

@property (nonatomic, weak) IBOutlet UIView *cellContentView;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *cellContentViewLeading;

@end

@implementation FTSelectedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self selectedCellSetup];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self selectedCellSetup];
    }
    return self;
}

- (void)selectedCellSetup {
    // 添加选中视图
    UIView *selectedView = [[UIView alloc] init];
    
    selectedView.hidden = YES;
    selectedView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:selectedView];
    self.selectedView = selectedView;
    // 添加选中图标
    UIImageView *selectedImageView = [[UIImageView alloc] init];
    
    [selectedView addSubview:selectedImageView];
    
    [selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(40);
        make.right.mas_equalTo(self.cellContentView.mas_left);
    }];
}

- (void)beginSelectedAnimated:(BOOL)animated {
    self.selectedView.hidden = NO;
    [self moveX:40 animated:animated completion:nil];
}

- (void)endSelectedAnimated:(BOOL)animated {
    [self moveX:0 animated:animated completion:^(BOOL finished) {
        self.selectedView.hidden = YES;
    }];
}

- (void)moveX:(CGFloat)x
     animated:(BOOL)animated
   completion:(void (^)(BOOL finished))completion{
    
    if (self.cellContentViewLeading) {
        self.cellContentViewLeading.constant = x;
    } else {
        [self.cellContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(x);
        }];
    }
    
    if (animated) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             [self.contentView layoutIfNeeded];
                         } completion:completion];
    }
}

#pragma mark - Setter/Getter
- (void)setItem:(FTSelectedCellItem *)item {
    _item = item;
    
    
}

- (UIView *)cellContentView {
    if (_cellContentView == nil) {
        UIView *cellContentView = [[UIView alloc] init];
        [self.contentView addSubview:cellContentView];
        _cellContentView = cellContentView;
        [cellContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self.contentView);
            make.width.mas_equalTo(self.contentView);
        }];
    }
    return _cellContentView;
}

@end
