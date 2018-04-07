//
//  FTSectionItem.m
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTSectionItem.h"

@interface FTSectionItem ()

@property (nonatomic, strong) NSMutableArray<FTFormBaseTableViewCell *> *formCellMArray;

@end

@implementation FTSectionItem

#pragma mark - Public
// 添加一个表单cell
- (void)addCell:(FTFormBaseTableViewCell *)cell {
    [self.formCellMArray addObject:cell];
}

// 插入一个表单cell
- (void)insertCell:(FTFormBaseTableViewCell *)cell
           atIndex:(NSInteger)index {
    [self.formCellMArray insertObject:cell
                              atIndex:index];
}

// 获取段落中第row行的表单cell
- (__kindof FTFormBaseTableViewCell *)cellForRow:(NSInteger)row {
    return row >= self.formCellMArray.count || row < 0? nil : self.formCellMArray[row];
}

#pragma mark - Setter/Getter
- (NSMutableArray<FTFormBaseTableViewCell *> *)formCellMArray {
    if (_formCellMArray == nil) {
        _formCellMArray = [NSMutableArray array];
    }
    return _formCellMArray;
}

// 段落行数
- (NSInteger)rowCount {
    return self.formCellMArray.count;
}

@end
