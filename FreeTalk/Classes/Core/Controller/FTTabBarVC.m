//
//  FTTabBarVC.m
//  FreeTalk
//
//  Created by wsong on 2018/4/6.
//  Copyright © 2018年 wsong. All rights reserved.
//

#import "FTTabBarVC.h"
#import "FTMessageVC.h"
#import "FTAddressBookVC.h"
#import "FTPhoneVC.h"
#import "FTDiscoverVC.h"
#import "FTMeVC.h"
#import "UITabBarItem+FTExtension.h"
#import "UIImage+FTExtension.h"
#import "FTToolMacros.h"
#import "FTNavigationVC.h"

@interface FTTabBarVC ()

@end

@implementation FTTabBarVC

+ (void)initialize {
    [UITabBar appearance].translucent = NO;
    [UITabBarItem appearance].titlePositionAdjustment = UIOffsetMake(0, -4);
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:9],
                                                        NSForegroundColorAttributeName : FT_COLOR_GRAY(113)}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:9],
                                                        NSForegroundColorAttributeName : FT_COLOR_THEME}
                                             forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setupAllChildVC];
}

- (void)setupAllChildVC {
    // 消息
    [self setupChildVC:[[FTMessageVC alloc] init]
                 image:[UIImage ft_originImageWithImageNamed:@"message_normal"]
         selectedImage:[UIImage ft_originImageWithImageNamed:@"message_selected"]
                 title:@"消息"
     imageBottomMargin:0];
    // 通讯录
    [self setupChildVC:[[FTAddressBookVC alloc] init]
                 image:[UIImage ft_originImageWithImageNamed:@"contacts_normal"]
         selectedImage:[UIImage ft_originImageWithImageNamed:@"contacts_selected"]
                 title:@"通讯录"
     imageBottomMargin:0];
    // 电话
    [self setupChildVC:[[FTPhoneVC alloc] init]
                 image:[UIImage ft_originImageWithImageNamed:@"phone_normal"]
         selectedImage:[UIImage ft_originImageWithImageNamed:@"phone_selected"]
                 title:@"电话"
     imageBottomMargin:14];
    // 发现
    [self setupChildVC:[[FTDiscoverVC alloc] init]
                 image:[UIImage ft_originImageWithImageNamed:@"more_normal"]
         selectedImage:[UIImage ft_originImageWithImageNamed:@"more_selected"]
                 title:@"发现"
     imageBottomMargin:0];
    // 我
    [self setupChildVC:[[FTMeVC alloc] init]
                 image:[UIImage ft_originImageWithImageNamed:@"mine_normal"]
         selectedImage:[UIImage ft_originImageWithImageNamed:@"mine_selected"]
                 title:@"我"
     imageBottomMargin:0];
}

- (void)setupChildVC:(UIViewController *)vc
               image:(UIImage *)image
       selectedImage:(UIImage *)selectedImage
               title:(NSString *)title
   imageBottomMargin:(CGFloat)imageBottomMargin {
    
    FTNavigationVC *navVC = [[FTNavigationVC alloc] initWithRootViewController:vc];
    [self addChildViewController:navVC];
    navVC.tabBarItem.image = image;
    navVC.tabBarItem.selectedImage = selectedImage;
    navVC.tabBarItem.title = title;
    navVC.tabBarItem.ft_imageBottomMargin = imageBottomMargin;
}

@end
