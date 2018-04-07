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

@interface FTPhoneVC ()
<FTSegmentedControlDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FTPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self.tableView ft_registerCellNibClass:[FTPhoneCell class]];
}

// 设置导航栏内容
- (void)setupNavigationBar {
    
    FTSegmentedControl *segmentedControl = [[FTSegmentedControl alloc] initWithItems:@[@"全部通话", @"未接来电"]];

    segmentedControl.themeColor = FT_COLOR_THEME;
    segmentedControl.delegate = self;
    self.navigationItem.titleView = segmentedControl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rightBarButtonItemClick)];
}

- (void)rightBarButtonItemClick {
    
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FTPhoneCell *cell = [tableView ft_dequeueReusableCellWithNibClass:[FTPhoneCell class]
                                                         forIndexPath:indexPath];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
