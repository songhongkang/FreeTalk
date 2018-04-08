//
//  UITableView+FTExtension.m
//  FreeTalk
//
//  Created by wsong on 2018/4/7.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "UITableView+FTExtension.h"

@implementation UITableView (FTExtension)

// 注册一个cell
- (void)ft_registerCellNibClass:(Class)cellNibClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellNibClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellNibClass)];
}

// 获取一个cell
- (__kindof UITableViewCell *)ft_dequeueReusableCellWithNibClass:(Class)nibClass
                                                    forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(nibClass) forIndexPath:indexPath];
}

// 段头尾分隔占位视图，iOS 11需要
- (UIView *)ft_placeholderHeaderFooterView {
    
    UIView *placeholderView = [self dequeueReusableHeaderFooterViewWithIdentifier:@"placeholder"];
    
    if (placeholderView == nil) {
        placeholderView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"placeholder"];
        placeholderView.hidden = YES;
    }
    return placeholderView;
}
 
@end
