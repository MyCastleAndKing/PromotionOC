//
//  MWorldTabBarController.m
//  PromotionOC
//
//  Created by EDZ on 2019/12/3.
//  Copyright © 2019 MWorld. All rights reserved.
//

#import "MWorldTabBarController.h"

@interface MWorldTabBarController () <UITabBarControllerDelegate>

@end

@implementation MWorldTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/// 构建tabBar数组
- (NSArray *)viewControllerForTabBar {
    // first
    FirstPartyTableViewController *firstVC = [[FirstPartyTableViewController alloc] init];
    UIViewController *firstNav = [[CYLBaseNavigationController alloc] initWithRootViewController:firstVC];
    [firstNav cyl_setHideNavigationBarSeparator:YES];
    // second
    SecondPartyViewController *secondVC = [[SecondPartyViewController alloc] init];
    UIViewController *secondNav = [[CYLBaseNavigationController alloc] initWithRootViewController:secondVC];
    [secondNav cyl_setHideNavigationBarSeparator:YES];
    NSArray *viewControllers = @[firstNav, secondNav];
    
    return viewControllers;
}


/// 设置tabBar属性
- (NSArray *)buildAttributeStatusForTabBarItems {
    CGFloat firstXOffset = -12/2;
    // first
    NSDictionary *firstTabBarItemsAttr = @{CYLTabBarItemTitle:@"首页",
                                           CYLTabBarItemImage:[UIImage imageNamed:@"home_normal"],
                                           CYLTabBarItemSelectedImage:[UIImage imageNamed:@"home_highlight"],
                                           CYLTabBarItemTitlePositionAdjustment:[NSValue valueWithUIOffset:UIOffsetMake(firstXOffset, -3.5)],
                                           CYLTabBarLottieURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tab_home_animate" ofType:@"json"]],
    };
    // second
    CGFloat secondXOffset = (-25+2)/2;
    NSDictionary *secondTabBarItemAttr = @{CYLTabBarItemTitle:@"鱼塘",
                                           CYLTabBarItemImage:[UIImage imageNamed:@"fishpond_normal"],
                                           CYLTabBarItemSelectedImage:[UIImage imageNamed:@"fishpond_highlight"],
                                           CYLTabBarItemTitlePositionAdjustment:[NSValue valueWithUIOffset:UIOffsetMake(secondXOffset, -3.5)],
                                           CYLTabBarLottieURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tab_search_animate" ofType:@"json"]],
    };
    NSArray *tabBarItemAttributes = @[firstTabBarItemsAttr, secondTabBarItemAttr];
    
    return tabBarItemAttributes;
}


/// 设置更多自定义tabBarItem属性 选中文字|不选中文字 背景图片 等等
- (void)customTabBarAppearance {
    // 自定义tabBar高度
    // self.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [[NSMutableDictionary alloc] init];
    [normalAttrs setValue:[UIColor cyl_systemGrayColor] forKey:NSForegroundColorAttributeName];
    // 选中状态下的文字属性
    NSMutableDictionary *selectAttrs = [[NSMutableDictionary alloc] init];
    [selectAttrs setValue:[UIColor cyl_labelColor] forKey:NSForegroundColorAttributeName];
    // 设置文字属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    
}











/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
