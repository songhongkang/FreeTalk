//
//  UIView+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/6.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "UIView+FTExtension.h"

@implementation UIView (FTExtension)

- (void)setFt_originX:(CGFloat)ft_originX {
    CGRect tmpRect = self.frame;
    tmpRect.origin.x = ft_originX;
    self.frame = tmpRect;
}

- (CGFloat)ft_originX {
    return self.frame.origin.x;
}

- (void)setFt_originY:(CGFloat)ft_originY {
    CGRect tmpRect = self.frame;
    tmpRect.origin.y = ft_originY;
    self.frame = tmpRect;
}

- (CGFloat)ft_originY {
    return self.frame.origin.y;
}

- (void)setFt_sizeW:(CGFloat)ft_sizeW {
    CGRect tmpRect = self.frame;
    tmpRect.size.width = ft_sizeW;
    self.frame = tmpRect;
}

- (CGFloat)ft_sizeW {
    return self.frame.size.width;
}

- (void)setFt_sizeH:(CGFloat)ft_sizeH {
    CGRect tmpRect = self.frame;
    tmpRect.size.height = ft_sizeH;
    self.frame = tmpRect;
}

- (CGFloat)ft_sizeH {
    return self.frame.size.height;
}

- (void)setFt_cornerRadius:(CGFloat)ft_cornerRadius {
    self.layer.cornerRadius = ft_cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)ft_cornerRadius {
    return self.layer.cornerRadius;
}

@end
