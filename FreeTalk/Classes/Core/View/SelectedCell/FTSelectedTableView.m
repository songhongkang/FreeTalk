//
//  FTSelectedTableView.m
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTSelectedTableView.h"
#import "FTSelectedCell.h"

@implementation FTSelectedTableView

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated {
    _selected = selected;
    
    if (selected) {
        for (FTSelectedCell *cell in self.visibleCells) {
            [cell beginSelectedAnimated:animated];
        }
    } else {
        for (FTSelectedCell *cell in self.visibleCells) {
            [cell endSelectedAnimated:animated];
        }
    }
}

@end
