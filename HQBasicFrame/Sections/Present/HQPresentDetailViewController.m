//
//  HQPresentDetailViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPresentDetailViewController.h"
#import "HQPresentSubDetailViewController.h"

@interface HQPresentDetailViewController ()

@end

@implementation HQPresentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *next = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [next setTitle:@"Present" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    UIButton *pre = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 100, 50)];
    [pre setTitle:@"Pre" forState:UIControlStateNormal];
    [pre addTarget:self action:@selector(pre) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pre];
}

- (void)next
{
    HQPresentSubDetailViewController *subDetailVC = [[HQPresentSubDetailViewController alloc] init];
    [self presentViewController:subDetailVC animated:YES completion:^{
        
    }];
}

- (void)pre
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
