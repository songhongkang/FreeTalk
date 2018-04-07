//
//  UIImage+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/6.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "UIImage+FTExtension.h"

@implementation UIImage (FTExtension)

// 获取一张原始图片
+ (UIImage *)ft_originImageWithImageNamed:(NSString *)name {
    return [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

// 根据颜色获取一张图片
+ (UIImage *)ft_imageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), YES, 0);
    [color set];
    UIRectFill(CGRectMake(0, 0, 1, 1));
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return colorImage;
}

@end
