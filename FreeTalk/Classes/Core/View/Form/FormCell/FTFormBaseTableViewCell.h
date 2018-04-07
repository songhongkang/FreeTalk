//
//  FTFormBaseTableViewCell.h
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTFormBaseTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^onClick)(void);

/**
 默认从xib中加载
 
 @return cell
 */
+ (instancetype)cell;

@end
