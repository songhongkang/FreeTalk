//
//  FTToolMacros.h
//  FreeTalk
//
//  Created by wsong on 2018/4/2.
//  Copyright © 2018年 wsong. All rights reserved.
//

#ifndef FTToolMacros_h
#define FTToolMacros_h

/************************** 常用头文件 **********************/
#import "UITableView+FTExtension.h"

/************************** 颜色宏 **********************/
#define FT_COLOR_A(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]
#define FT_COLOR(r, g, b) FT_COLOR_A(r, g, b, 1)
#define FT_COLOR_GRAY(value) FT_COLOR(value, value, value)
/** 主题色 */
#define FT_COLOR_THEME FT_COLOR(10, 210, 166)


/*************** 虚假方法，只做方法声明，避免其他地方警告 **********************/
@protocol FTVirtualMethod

- (void)ft_layoutSubviews;

@end

#endif /* FTToolMacros_h */
