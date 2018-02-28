//
//  HQPushDetailViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPushDetailViewController.h"
#import <RTRootNavigationController.h>
#import "HQPushSubDetailViewController.h"
@interface HQPushDetailViewController ()

@end

@implementation HQPushDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *next = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [next setTitle:@"Push" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    if ([self.title isEqualToString:@"PopDisable"]) {
        self.rt_disableInteractivePop = YES;
    }
}

- (void)next
{
    if ([self.title isEqualToString:@"PushAndRemove"]) {
        HQPushSubDetailViewController *detailVC = [[HQPushSubDetailViewController alloc] init];
        detailVC.title = @"detailVc";
        [self.rt_navigationController pushViewController:detailVC animated:YES complete:^(BOOL finished) {
            [self.rt_navigationController removeViewController:self animated:YES];
        }];
    }else if ([self.title isEqualToString:@"Push"]) {
        HQPushSubDetailViewController *detailVC = [[HQPushSubDetailViewController alloc] init];
        detailVC.title = @"detailVc";
        [self.navigationController pushViewController:detailVC animated:YES];
    }else {
        
        HQPushSubDetailViewController *detailVC = [[HQPushSubDetailViewController alloc] init];
        detailVC.title = @"detailVc";
        [self.navigationController pushViewController:detailVC animated:YES];
    }
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
