//
//  FTFormTableView.h
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTSectionItem.h"

@interface FTFormTableView : UITableView

/** 段落数 */
@property (nonatomic, assign, readonly) NSInteger sectionCount;

/**
 添加一个表单段落
 
 @param section 表单段落
 */
- (void)addSection:(void (^)(FTSectionItem *section))section;

/**
 插入一个表单段落
 
 @param section 表单段落
 @param index 插入位置
 */
- (void)insertSection:(void (^)(FTSectionItem *section))section
              atIndex:(NSUInteger)index;

@end
