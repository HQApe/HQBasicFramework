//
//  HQToastViewController.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQToastViewController.h"
#import <Toast.h>
#import "HQTrackManager.h"

#import "UIView+HQ_Toast.h"

@interface HQToastViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HQToastViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [HQTrackManager trackPageViewBeginWithKey:@"toast" name:@"Toast"];
    [super viewDidAppear:animated];
    
    [self.view showLoadingHUD];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view hideLoadingHUD];
    });
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [HQTrackManager trackPageViewEndWithKey:@"toast" name:@"Toast"];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"Top";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"Center";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"Bottom";
        }
            break;
        case 3:
        {
            cell.textLabel.text = @"Message Toast";
        }
            break;
        case 4:
        {
            cell.textLabel.text = @"Image&Titile Toast";
        }
            break;
        case 5:
        {
            cell.textLabel.text = @"Custom Toast";
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
            [self.view makeToast:@"Top Toast" duration:1.0 position:CSToastPositionTop];
            [HQTrackManager trackEventWithKey:@"clickTop" name:@"在上方显示Toast"];
        }
            break;
        case 1:
        {
            [self.view makeToast:@"Center Toast" duration:1.0 position:CSToastPositionCenter];
            [HQTrackManager trackEventWithKey:@"clickCenter" name:@"在中间显示Toast"];
        }
            break;
        case 2:
        {
            [self.view makeToast:@"Bottom Toast" duration:1.0 position:CSToastPositionBottom];
            [HQTrackManager trackEventWithKey:@"clickBottom" name:@"在下方显示Toast"];
        }
            break;
        case 3:
        {
            [self.view showMessage:@"This is message toast"];
        }
            break;
        case 4:
        {
            [self.view showMessage:@"This is Message&Image toast" title:@"Hello Toast" image:@"icon"];
        }
            break;
        case 5:
        {
            [HQTrackManager trackEventWithKey:@"clickLoading" name:@"点击了加载动画"];
            [self.view showLoadingHUD];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.view hideLoadingHUD];
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
