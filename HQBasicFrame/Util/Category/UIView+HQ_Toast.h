//
//  UIView+HQ_Toast.h
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/2/22.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HQ_Toast)

- (void)showMessage:(NSString *)message;
- (void)showMessage:(NSString *)message title:(NSString *)title image:(NSString *)imageName;

- (void)showLoadingHUD;
- (void)hideLoadingHUD;


@end
