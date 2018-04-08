//
//  FTNavigationVC.m
//  FreeTalk
//
//  Created by wsong on 2018/4/8.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTNavigationVC.h"
#import "FTToolMacros.h"

@interface FTNavigationVC ()

@end

@implementation FTNavigationVC

+ (void)initialize {
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                           NSForegroundColorAttributeName : FT_COLOR_THEME}
                                                forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                           NSForegroundColorAttributeName : FT_COLOR_THEME}
                                                forState:UIControlStateHighlighted];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
}
    
@end
