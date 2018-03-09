//
//  HQTabBarViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/25.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQTabBarViewController.h"
#import "HQNavigationController.h"
#import "HQPushViewController.h"
#import "HQPresentViewController.h"
#import "HQToastViewController.h"

@interface HQTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation HQTabBarViewController

+ (instancetype)shareInstance
{
    static HQTabBarViewController *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HQTabBarViewController alloc] init];
    });
    return _instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self setupAllChildViewController];
}

- (void)setupAllChildViewController {
    
    HQPushViewController *homeVC = [[HQPushViewController alloc] init];
    homeVC.title = @"Push";
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    HQNavigationController *homeNVC = [[HQNavigationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:homeNVC];
    
    HQPresentViewController *historyVC = [[HQPresentViewController alloc] init];
    historyVC.title = @"Present";
    historyVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
    HQNavigationController *historyNVC = [[HQNavigationController alloc] initWithRootViewController:historyVC];
    [self addChildViewController:historyNVC];
    
    HQToastViewController *mineVC = [[HQToastViewController alloc] init];
    mineVC.title = @"Toast";
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    HQNavigationController *mineNVC = [[HQNavigationController alloc] initWithRootViewController:mineVC];
    [self addChildViewController:mineNVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
