//
//  NSObject+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/2.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "NSObject+FTExtension.h"
#import <objc/runtime.h>

@implementation NSObject (FTExtension)

// 交换两个对象方法
+ (void)ft_swizzlingInstanceOriginSelector:(SEL)originSelector
                     withSwizzlingSelector:(SEL)swizzlingSelector {
    
    Method originMethod = class_getInstanceMethod(self, originSelector);
    Method swizzlingMethod = class_getInstanceMethod(self, swizzlingSelector);
    IMP originIMP = method_getImplementation(originMethod);
    IMP swizzlingIMP = method_getImplementation(swizzlingMethod);
    
    if (originIMP) {
        // 有原方法，进行交换
        method_exchangeImplementations(originMethod, swizzlingMethod);
    } else {
        // 直接添加方法
        class_addMethod(self, originSelector, swizzlingIMP, method_getTypeEncoding(originMethod));
    }
}

// 判断两个selector是否是同一个方法
+ (BOOL)ft_isIMPEqualSelector1:(SEL)selector1
                 withSelector2:(SEL)selector2 {
    
    Method method1 = class_getInstanceMethod(self, selector1);
    Method method2 = class_getInstanceMethod(self, selector2);
    IMP imp1 = method_getImplementation(method1);
    IMP imp2 = method_getImplementation(method2);
    return imp1 == imp2;
}

@end
