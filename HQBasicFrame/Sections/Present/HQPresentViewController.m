//
//  HQPresentViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPresentViewController.h"
#import <RTRootNavigationController.h>
#import "HQPushViewController.h"
#import "HQPresentDetailViewController.h"
#import "HQNavigationController.h"

@interface HQPresentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HQPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"Present";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"PresentPush";
        }
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            HQPresentDetailViewController *detailVC = [[HQPresentDetailViewController alloc] init];
            detailVC.title = @"Present";
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:detailVC animated:YES completion:^{
                    
                }];
            });
        }
            break;
        case 1:
        {
            HQPushViewController *detailVC = [[HQPushViewController alloc] init];
            detailVC.title = @"Push";
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:[[HQNavigationController alloc] initWithRootViewController:detailVC] animated:YES completion:^{
                    
                }];
            });
        }
            break;
        default:
            break;
    }
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
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
