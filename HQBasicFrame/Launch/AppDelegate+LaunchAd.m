//
//  AppDelegate+LaunchAd.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/25.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "AppDelegate+LaunchAd.h"
#import <AFNetworking.h>

#import "HQTabBarViewController.h"
#import "HQBasicViewController.h"
#import "LaunchAdModel.h"

@implementation AppDelegate (LaunchAd)

- (void)applicationConfigLaunchingAd
{

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchScreen];
    
    //1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
    //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
    //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
    [XHLaunchAd setWaitDataDuration:3];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"https://mobile.55700.com/startPage.htm" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"广告数据 = %@",responseObject);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:responseObject];
        //配置广告数据
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
        //广告停留时间
        imageAdconfiguration.duration = 5;
        //广告frame
        imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 13.0/9);
        //为告展示效果更好,可设置为XHLaunchAdImageCacheInBackground,先缓存,下次显示
        imageAdconfiguration.imageOption = XHLaunchAdImageCacheInBackground;
        //自定义跳过按钮
        imageAdconfiguration.customSkipView = [self customSkipView];
        //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
        imageAdconfiguration.imageNameOrURLString = [NSString stringWithFormat:@"%@%@", @"https://image.55700.com/", model.advertUrl];
        //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
        imageAdconfiguration.openModel = model;
        //后台返回时,是否显示广告
        imageAdconfiguration.showEnterForeground = YES;
        //显示开屏广告
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(UIView *)customSkipView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.4];
    button.layer.cornerRadius = 25.0;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.titleLabel.textColor = [UIColor grayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:@"跳过\n3s"];
    [attrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:(NSRange){2, 2}];
    [attrTitle addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:(NSRange){2, 2}];
    [button setAttributedTitle:attrTitle forState:UIControlStateNormal];
    CGFloat y = XH_IPHONEX ? 54 : 30;
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60,y, 50, 50);
    [button addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)skipAction
{
    //移除广告
    [XHLaunchAd removeAndAnimated:YES];
}

- (void)xhLaunchAd:(XHLaunchAd *)launchAd customSkipView:(UIView *)customSkipView duration:(NSInteger)duration
{
    UIButton *skipButton = (UIButton *)customSkipView;//此处转换为你之前的类型
    //设置自定义跳过按钮倒计时
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"跳过\n%lds",(long)duration]];
    [attrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:(NSRange){2, 2}];
    [attrTitle addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:(NSRange){2, 2}];
    [skipButton setAttributedTitle:attrTitle forState:UIControlStateNormal];
}

-(void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint{
    
    NSLog(@"广告点击事件");
    /** openModel即配置广告数据设置的点击广告时打开页面参数(configuration.openModel) */
    if(openModel==nil || ![openModel isKindOfClass:[LaunchAdModel class]]) return;
    LaunchAdModel *adModel = (LaunchAdModel *)openModel;
    
    UINavigationController *sourceVC = [HQTabBarViewController shareInstance].selectedViewController;
    HQBasicViewController *webVc = [[HQBasicViewController alloc] init];
    [sourceVC pushViewController:webVc animated:YES];
}

/**
 如果你想用SDWebImage等框架加载网络广告图片,请实现此代理(注意:实现此方法后,图片缓存将不受XHLaunchAd管理)
 */
//-(void)xhLaunchAd:(XHLaunchAd *)launchAd launchAdImageView:(UIImageView *)launchAdImageView URL:(NSURL *)url
//{
//    [launchAdImageView sd_setImageWithURL:url];
//}

@end
