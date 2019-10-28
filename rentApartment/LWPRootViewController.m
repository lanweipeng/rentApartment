//
//  LWPRootViewController.m
//  rentApartment
//
//  Created by iMac on 19/3/6.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import "LWPRootViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SettingViewController.h"
#import "UIImage+HKExtension.h"
@interface LWPRootViewController ()

@end

@implementation LWPRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVCs];
    
}
/**
 *  添加所有的子控制器
 */
- (void)addChildVCs{
    //首页
    [self setUpChildViewController:[[HomeViewController alloc]init] title:@"首页" imageNamed:@"tabBar_essence_icon"];
    
    //信息
    [self setUpChildViewController:[[MessageViewController alloc]init] title:@"信息" imageNamed:@"tabBar_friendTrends_icon"];
    
    
    
    //我
    [self setUpChildViewController:[[SettingViewController alloc]init] title:@"我" imageNamed:@"tabBar_me_icon"];
}


//创建子控制的方法
-(void)setUpChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageName{
    //精华
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    NSString * selectImageName = [imageName stringByAppendingString:@"_click"];
    //  [NSString stringWithFormat:@"%@_click",imageName];
    vc.tabBarItem.selectedImage = [UIImage hk_originarImageNamed:selectImageName];
    [self addChildViewController:vc];
}@end
