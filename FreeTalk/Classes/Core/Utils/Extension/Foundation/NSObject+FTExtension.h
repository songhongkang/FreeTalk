//
//  NSObject+FTExtension.h
//  FreeTalk
//
//  Created by wsong on 2018/4/2.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FTExtension)

/**
 交换两个对象方法
 
 @param originSelector 原方法
 @param swizzlingSelector 交换的方法
 */
+ (void)ft_swizzlingInstanceOriginSelector:(SEL)originSelector
                     withSwizzlingSelector:(SEL)swizzlingSelector;

/**
 判断两个selector是否是同一个方法
 配合方法交换使用：
 如originSelector不存在时，回调originSelector需加判断，
 否则会导致递归调用，一般用于交换代理方法
 
 @param selector1 方法1
 @param selector2 方法2
 @return YES表示是同一个方法，则反
 */
+ (BOOL)ft_isIMPEqualSelector1:(SEL)selector1
                 withSelector2:(SEL)selector2;

@end
