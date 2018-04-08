//
//  FTSelectedCellItem.h
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//  需要多选的cell模型请继承该类

#import <Foundation/Foundation.h>

@interface FTSelectedCellItem : NSObject

@property (nonatomic, assign, getter=isSelected) BOOL selected;

@end
