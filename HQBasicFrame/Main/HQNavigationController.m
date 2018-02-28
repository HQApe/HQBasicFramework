//
//  HQNavigationController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/25.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQNavigationController.h"

@interface HQNavigationController ()

@end

@implementation HQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.rt_viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self hiddenTabBar];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (void)hiddenTabBar
{
    
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
