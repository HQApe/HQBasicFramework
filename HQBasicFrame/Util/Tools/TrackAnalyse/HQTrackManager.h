//
//  HQTrackManager.h
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/3/9.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQTrackManager : NSObject


/**
 统计初始化
 */
+ (void)trackAnalyseConfig;

/**
 使用时长统计开始
 */
+ (void)trackActiveBegin;

/**
 使用时长统计结束
 */
+ (void)trackActiveEnd;

/**
 事件埋点
 @param key 事件Id，在后台配置
 @param name 事件名称，客户端说明，便于理解
 */
+ (void)trackEventWithKey:(NSString *)key name:(NSString *)name;

/**
 页面时长统计开始
 @param page 页面Id，在后台配置
 @param name 页面名称，客户端说明，便于理解
 */
+ (void)trackPageViewBeginWithKey:(NSString *)page name:(NSString *)name;

/**
 页面时长统计结束
 @param page 页面Id，在后台配置
 @param name 页面名称，客户端说明，便于理解
 */
+ (void)trackPageViewEndWithKey:(NSString *)page name:(NSString *)name;



@end
