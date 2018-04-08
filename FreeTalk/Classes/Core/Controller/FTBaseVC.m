//
//  FTBaseVC.m
//  FreeTalk
//
//  Created by wsong on 2018/3/29.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTBaseVC.h"
#import "FTToolMacros.h"

@interface FTBaseVC ()

@end

@implementation FTBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建导航栏
    _navigationBar = [FTNavigationBar navigationBar];
    [self.view addSubview:_navigationBar];
    
    [_navigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
    }];
}

@end
