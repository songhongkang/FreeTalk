//
//  UIImage+FTExtension.h
//  FreeTalk
//
//  Created by wsong on 2018/4/6.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FTExtension)

/**
 获取一张原始图片

 @param name 图片名称
 @return 原始图片
 */
+ (UIImage *)ft_originImageWithImageNamed:(NSString *)name;

/**
 根据颜色获取一张图片

 @param color 颜色
 @return 颜色图片
 */
+ (UIImage *)ft_imageWithColor:(UIColor *)color;

@end
