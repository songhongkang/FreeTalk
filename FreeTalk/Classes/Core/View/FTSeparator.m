//
//  FTSeparator.m
//  FreeTalk
//
//  Created by wsong on 2018/4/7.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTSeparator.h"
#import "FTToolMacros.h"
#import "UIView+FTExtension.h"

@interface FTSeparator ()

@property (nonatomic, strong) CALayer *separator;

@end

@implementation FTSeparator

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.separator = [CALayer layer];
    self.separator.backgroundColor = FT_COLOR_A(222, 222, 222, 0.8).CGColor;
    [self.layer addSublayer:self.separator];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.separator.frame = CGRectMake(0, 0, self.ft_sizeW, self.ft_sizeH);
}

@end
