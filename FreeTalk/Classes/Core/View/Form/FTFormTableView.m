//
//  FTFormTableView.m
//  FreeTalk
//
//  Created by wsong on 2018/4/4.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTFormTableView.h"
#import "FTFormBaseTableViewCell.h"
#import "FTSectionItem.h"

@interface FTFormTableView ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<FTSectionItem *> *sectionItemMArray;

@end

@implementation FTFormTableView

#pragma mark - Public
// 添加一个表单段落
- (void)addSection:(void (^)(FTSectionItem *section))section {
    FTSectionItem *sectionItem = [[FTSectionItem alloc] init];
    [self.sectionItemMArray addObject:sectionItem];
    section(sectionItem);
}

// 插入一个表单段落
- (void)insertSection:(void (^)(FTSectionItem *section))section
              atIndex:(NSUInteger)index {
    FTSectionItem *sectionItem = [[FTSectionItem alloc] init];
    [self.sectionItemMArray addObject:sectionItem];
    section(sectionItem);
}

#pragma mark - Override
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    [super setDataSource:self];
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    [super setDelegate:self];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionItemMArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionItemMArray[section].rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.sectionItemMArray[indexPath.section] cellForRow:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FTFormBaseTableViewCell *cell = [self.sectionItemMArray[indexPath.section] cellForRow:indexPath.row];
    
    if (cell.onClick) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        cell.onClick();
    }
}

#pragma mark - Private
- (void)setup {
    self.dataSource = self;
    self.delegate = self;
}

#pragma mark - Setter/Getter
- (NSMutableArray<FTSectionItem *> *)sectionItemMArray {
    if (_sectionItemMArray == nil) {
        _sectionItemMArray = [NSMutableArray array];
    }
    return _sectionItemMArray;
}

// 段落数
- (NSInteger)sectionCount {
    return self.sectionItemMArray.count;
}

@end
