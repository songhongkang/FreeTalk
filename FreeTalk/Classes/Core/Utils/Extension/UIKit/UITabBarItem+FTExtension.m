//
//  UITabBarItem+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/2.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "UITabBarItem+FTExtension.h"
#import <objc/runtime.h>
#import "NSObject+FTExtension.h"
#import "FTToolMacros.h"
#import "UIView+FTExtension.h"

// 重新调整tabbar图片位置
static void ft_layoutSubviews(id obj, SEL sel) {
    [obj performSelector:@selector(ft_layoutSubviews)];

    Class tabBarButtonClass = NSClassFromString(@"UITabBarButton");

    if ([obj isKindOfClass:tabBarButtonClass]) {
        
        NSArray<UITabBarItem *> *items = [obj valueForKeyPath:@"tabBar.items"];
        NSArray *buttonArray = [items valueForKeyPath:@"view"];
        UITabBarItem *item = items[[buttonArray indexOfObject:obj]];
        
        if (item.ft_imageBottomMargin > 0) {
            UIImageView *imageView = [obj valueForKeyPath:@"info"];
            imageView.ft_originY = [obj frame].size.height - item.ft_imageBottomMargin - imageView.ft_sizeH;
        }
    }
}

@implementation UITabBarItem (FTExtension)

+ (void)load {

    Class tabBarButtonClass = NSClassFromString(@"UITabBarButton");

    class_addMethod(tabBarButtonClass,
                    @selector(ft_layoutSubviews),
                    (IMP)ft_layoutSubviews,
                    method_getTypeEncoding(class_getInstanceMethod(self, @selector(layoutSubviews))));
    [tabBarButtonClass ft_swizzlingInstanceOriginSelector:@selector(layoutSubviews)
                                    withSwizzlingSelector:@selector(ft_layoutSubviews)];
}

#pragma mark - Setter/Getter
- (void)setFt_imageBottomMargin:(CGFloat)ft_imageBottomMargin {
    objc_setAssociatedObject(self, @selector(ft_imageBottomMargin), @(ft_imageBottomMargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)ft_imageBottomMargin {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

@end
