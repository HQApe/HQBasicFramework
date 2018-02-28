//
//  HQPresentTestViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPresentTestViewController.h"

@interface HQPresentTestViewController ()

@end

@implementation HQPresentTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *next = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [next setTitle:@"Root" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    UIButton *pre = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 100, 50)];
    [pre setTitle:@"Pre" forState:UIControlStateNormal];
    [pre addTarget:self action:@selector(pre) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pre];
}

- (void)root
{
    UIViewController *vc = self.presentingViewController;
    if (!vc.presentingViewController) {
        return;
    }

    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }

    [vc dismissViewControllerAnimated:YES completion:nil];
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
