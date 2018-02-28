//
//  AppDelegate+Log.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/26.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

/*
 * 注意：集成Bugly,可以同时管理日志和奔溃处理
 *
 */

#import "AppDelegate+Log.h"
#import <CocoaLumberjack.h>

#ifdef DEBUG
#import <KSCrash/KSCrash.h>
#import <KSCrash/KSCrashInstallationStandard.h>
#else

#import <Bugly/Bugly.h>
#endif

@implementation AppDelegate (Log)

//!!DDLog 必须配置打印级别
#ifdef DEBUG
static const int ddLogLevel = DDLogLevelVerbose;
#else
static const int ddLogLevel = DDLogLevelWarning;
#endif

- (void)applicationLogConfig
{
#ifdef DEBUG
    [self debugLogConfig];
#else
    [self releaseLogConfig];
#endif
}

#ifdef DEBUG
- (void)debugLogConfig
{
    //配置DDLog
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    //开启DDLog 颜色，需要安装插件
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
//    [DDTTYLogger sharedInstance].logFormatter = [[MyCustomDDLogFormatter alloc] init];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.maximumFileSize = 50 * 1024 * 1024; //50MB
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    fileLogger.logFormatter = [[MyCustomDDLogFormatter alloc] init];
    [DDLog addLogger:fileLogger];
    
    NSLog(@"NSLog");
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    DDLogError(NSHomeDirectory());
    
    /*
     *注意：用Xcode运行是拿不到奔溃日志的，并提示：
     *
     ************************ Crash Handler Notice ************************
     *     App is running in a debugger. Masking out unsafe monitors.     *
     * This means that most crashes WILL NOT BE RECORDED while debugging! *
     **********************************************************************
     *脱离Xcode奔溃后，可以用Xcode再打开，就可以找到路径获得奔溃日志
     */
    KSCrashInstallationStandard* installation = [KSCrashInstallationStandard sharedInstance];
    installation.url = [NSURL URLWithString:@"http://put.your.url.here"];
    [installation install];
    // 此方法是确认崩溃报告发送后，如何处理旧的崩溃。
    [KSCrash sharedInstance].deleteBehaviorAfterSendAll = KSCDeleteNever;
    // 发送崩溃日志
    [installation sendAllReportsWithCompletion:^(NSArray* reports, BOOL completed, NSError* error) {
        if(completed) {
            NSLog(@"Sent %d reports", (int)[reports count]);
        }else {
            NSLog(@"Failed to send reports: %@", error);
        }
    }];
}

#else

- (void)releaseLogConfig
{
    BuglyConfig * config = [[BuglyConfig alloc] init];
    // 设置自定义日志上报的级别，默认不上报自定义日志
    config.reportLogLevel = BuglyLogLevelDebug;
    config.debugMode = YES;
    config.blockMonitorEnable = YES;
    
    [Bugly startWithAppId:@"f04a874b5b" config:config];
    
    BLYLogDebug(@"%@",@"测试信息");
}

#endif

@end
