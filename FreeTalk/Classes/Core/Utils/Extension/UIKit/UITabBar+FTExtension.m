//
//  UITabBar+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/2.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "UITabBar+FTExtension.h"
#import "UITabBarItem+FTExtension.h"
#import "NSObject+FTExtension.h"

@implementation UITabBar (FTExtension)

+ (void)load {
    [self ft_swizzlingInstanceOriginSelector:@selector(hitTest:withEvent:)
                       withSwizzlingSelector:@selector(ft_hitTest:withEvent:)];
}

- (UIView *)ft_hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    for (UITabBarItem *item in self.items) {
        if (item.ft_imageBottomMargin) {
            UIControl *control = [item valueForKeyPath:@"view"];
            UIImageView *imageView = [control valueForKeyPath:@"info"];
            CGPoint inImageViewPoint = [self convertPoint:point toView:imageView];
            if (CGRectContainsPoint(imageView.bounds, inImageViewPoint)) {
                return control;
            }
        }
    }
    
    return [self ft_hitTest:point withEvent:event];
}

@end
