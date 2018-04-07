//
//  UITableView+FTExtension.h
//  FreeTalk
//
//  Created by wsong on 2018/4/7.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (FTExtension)

/**
 注册一个cell
 
 @param cellNibClass cell的类
 */
- (void)ft_registerCellNibClass:(Class)cellNibClass;

/**
 获取一个cell
 
 @param nibClass cell的类
 @param indexPath 所在位置
 @return cell
 */
- (__kindof UITableViewCell *)ft_dequeueReusableCellWithNibClass:(Class)nibClass
                                                     forIndexPath:(NSIndexPath *)indexPath;

/**
 段头尾分隔占位视图，iOS 11需要
 
 @return 段头尾分隔占位视图
 */
- (UIView *)ft_placeholderHeaderFooterView;

@end
