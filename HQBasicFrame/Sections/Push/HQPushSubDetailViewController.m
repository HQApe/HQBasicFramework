//
//  HQPushSubDetailViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPushSubDetailViewController.h"
#import <RTRootNavigationController.h>
#import "HQPushTestViewController.h"

@interface HQPushSubDetailViewController ()

@end

@implementation HQPushSubDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *next = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [next setTitle:@"Push" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
}
- (void)nextStep
{
    HQPushTestViewController *testVC = [[HQPushTestViewController alloc] init];
    testVC.title = @"testVC";
    [self.rt_navigationController pushViewController:testVC animated:YES];
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
