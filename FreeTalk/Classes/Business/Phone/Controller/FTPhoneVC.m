//
//  FTPhoneVC.m
//  FreeTalk
//
//  Created by wsong on 2018/3/29.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTPhoneVC.h"
#import "FTToolMacros.h"
#import <objc/runtime.h>
#import "FTSegmentedControl.h"
#import "FTPhoneCell.h"
#import "FTSelectedTableView.h"
#import "UIView+FTExtension.h"

@interface FTPhoneVC ()
<FTSegmentedControlDelegate, FTNavigationBarDelegate,
UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet FTSelectedTableView *tableView;

@end

@implementation FTPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupNavigationBar];
    [self.tableView ft_registerCellNibClass:[FTPhoneCell class]];
}

// 设置导航栏内容
- (void)setupNavigationBar {
    
    FTSegmentedControl *segmentedControl = [[FTSegmentedControl alloc] initWithItems:@[@"全部通话", @"未接来电"]];
    
    segmentedControl.themeColor = FT_COLOR_THEME;
    segmentedControl.delegate = self;
    self.navigationBar.titleView = segmentedControl;
    self.navigationBar.rightTitle = @"编辑";
    self.navigationBar.delegate = self;
    self.navigationBar.largeTitle = @"最近通话";
    self.navigationBar.largeTitleScrollView = self.tableView;
}

#pragma mark - FTNavigationBarDelegate
- (void)navigationBarDidClickRightButton:(FTNavigationBar *)navigationBar {
    if ([navigationBar.rightTitle isEqualToString:@"编辑"]) {
        navigationBar.rightTitle = @"完成";
    } else {
        navigationBar.rightTitle = @"编辑";
    }
    [self.tableView setSelected:!self.tableView.isSelected
                       animated:YES];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(FTSelectedTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FTPhoneCell *cell = [tableView ft_dequeueReusableCellWithNibClass:[FTPhoneCell class]
                                                         forIndexPath:indexPath];
    
    tableView.isSelected? [cell beginSelectedAnimated:NO] : [cell endSelectedAnimated:NO];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!tableView.isEditing) {
        [tableView deselectRowAtIndexPath:indexPath
                                 animated:YES];
    }
    [self.navigationController pushViewController:[UIViewController new]
                                         animated:YES];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @[[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                    
                                                }]];
}

- (BOOL)tableView:(FTSelectedTableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return !tableView.isSelected;
}


@end
