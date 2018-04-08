//
//  FTSelectedCell.h
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTSelectedCellItem;

@interface FTSelectedCell : UITableViewCell

@property (nonatomic, strong) FTSelectedCellItem *item;

- (void)beginSelectedAnimated:(BOOL)animated;

- (void)endSelectedAnimated:(BOOL)animated;

@end
