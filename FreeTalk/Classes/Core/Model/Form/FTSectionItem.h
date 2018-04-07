//
//  FTSectionItem.h
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FTFormBaseTableViewCell;

@interface FTSectionItem : NSObject

/** 段落行数 */
@property (nonatomic, assign, readonly) NSInteger rowCount;

/**
 添加一个表单cell
 
 @param cell 表单cell
 */
- (void)addCell:(FTFormBaseTableViewCell *)cell;

/**
 插入一个表单cell
 
 @param cell 表单cell
 @param index 插入位置
 */
- (void)insertCell:(FTFormBaseTableViewCell *)cell
           atIndex:(NSInteger)index;

/**
 获取段落中第row行的表单cell

 @param row 行号
 @return 表单cell
 */
- (__kindof FTFormBaseTableViewCell *)cellForRow:(NSInteger)row;

@end
