//
//  FTSelectedTableView.h
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTSelectedTableView : UITableView

@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated;

@end
