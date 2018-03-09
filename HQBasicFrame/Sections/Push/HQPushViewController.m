//
//  HQPushViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQPushViewController.h"
#import <RTRootNavigationController.h>
#import "HQPushDetailViewController.h"
#import "HQTrackManager.h"

@interface HQPushViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HQPushViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [HQTrackManager trackPageViewBeginWithKey:@"push" name:@"Push"];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [HQTrackManager trackPageViewEndWithKey:@"push" name:@"Push"];
    [super viewDidDisappear:animated];
}

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"PushAndRemove";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"Push";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"PopDisable";
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
            HQPushDetailViewController *detailVC = [[HQPushDetailViewController alloc] init];
            detailVC.title = @"PushAndRemove";
            [self.rt_navigationController pushViewController:detailVC animated:YES complete:^(BOOL finished) {
            }];
        }
            break;
        case 1:
        {
            HQPushDetailViewController *detailVC = [[HQPushDetailViewController alloc] init];
            detailVC.title = @"Push";
            [self.navigationController pushViewController:detailVC animated:YES];
        }
            break;
        case 2:
        {
            HQPushDetailViewController *detailVC = [[HQPushDetailViewController alloc] init];
            detailVC.title = @"PopDisable";
            [self.navigationController pushViewController:detailVC animated:YES];
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
