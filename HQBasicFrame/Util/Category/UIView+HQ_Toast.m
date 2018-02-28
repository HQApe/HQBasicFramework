//
//  UIView+HQ_Toast.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "UIView+HQ_Toast.h"
#import <Toast.h>
#import <FLAnimatedImage.h>

@implementation UIView (HQ_Toast)

+ (void)load
{
    [CSToastManager setTapToDismissEnabled:NO];
    [CSToastManager setQueueEnabled:YES];
}

- (void)showMessage:(NSString *)message
{
    [self hideAllToasts];
    UIView *toast = [self toastViewForMessage:message title:nil image:nil style:nil];
    toast.center = self.center;
    //添加屏蔽层
    UIView *shadowView = [[UIView alloc] initWithFrame:self.bounds];
    [shadowView addSubview:toast];
    
    [self showToast:shadowView duration:1.5 position:CSToastPositionCenter completion:nil];
}

- (void)showMessage:(NSString *)message title:(NSString *)title image:(NSString *)imageName
{
    [self hideAllToasts];
    
    UIView *toast = [self toastViewForMessage:message title:nil image:nil style:nil];
    toast.center = self.center;
    //添加屏蔽层
    UIView *shadowView = [[UIView alloc] initWithFrame:self.bounds];
    [shadowView addSubview:toast];
    
    [self showToast:shadowView duration:1.5 position:CSToastPositionCenter completion:nil];
}

- (void)showLoadingHUD
{
    [self hideAllToasts];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loading" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.bounds = CGRectMake(0, 0, 100, 100);
    imageView.center = self.center;
    imageView.runLoopMode = NSRunLoopCommonModes;
    //添加屏蔽层
    UIView *shadowView = [[UIView alloc] initWithFrame:self.bounds];
    [shadowView addSubview:imageView];
    
    [self showToast:shadowView duration:NSUIntegerMax position:CSToastPositionCenter completion:^(BOOL didTap) {
    }];
}

- (void)hideLoadingHUD
{
    [self hideAllToasts];
}

@end
