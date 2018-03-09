//
//  HQTrackManager.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/3/9.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "HQTrackManager.h"
#import <MTA.h>
//#import <MTAConfig.h> //如要配置，请使用

@implementation HQTrackManager

+ (void)trackAnalyseConfig
{
    [MTA startWithAppkey:@"I57U86IELQFT"];
}

+ (void)trackActiveBegin
{
    [MTA trackActiveBegin];
}

+ (void)trackActiveEnd
{
    [MTA trackActiveEnd];
}

+ (void)trackEventWithKey:(NSString *)key name:(NSString *)name
{
    [MTA trackCustomKeyValueEvent:key props:nil];
}

+ (void)trackPageViewBeginWithKey:(NSString *)page name:(NSString *)name
{
    [MTA trackPageViewBegin:page];
}

+ (void)trackPageViewEndWithKey:(NSString *)page name:(NSString *)name
{
    [MTA trackPageViewEnd:page];
}

@end
