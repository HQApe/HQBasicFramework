//
//  AppDelegate+Launch.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/3/9.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "AppDelegate+Launch.h"
#import "AppDelegate+LaunchAd.h"

#import <OnboardingViewController.h>
#import <OnboardingContentViewController.h>

#import "HQTabBarViewController.h"

static NSString * const kUserHasOnboardedKey = @"user_has_onboarded";

@implementation AppDelegate (Launch)

- (void)appLaunchRootViewController
{
    BOOL userHasOnboarded = [[NSUserDefaults standardUserDefaults] boolForKey:kUserHasOnboardedKey];
    if (userHasOnboarded) {
        [self applicationConfigLaunchingAd];
        [self setupNormalRootViewController];
    }else {
        self.window.rootViewController = [self generateStandardOnboardingVC];
    }
}

- (UIViewController *)generateStandardOnboardingVC
{
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"What A Beautiful Photo" body:@"This city background image is so beautiful." image:[UIImage imageNamed:@"street"] buttonText:@"Enable Location Services" action:^{
        [[[UIAlertView alloc] initWithTitle:nil message:@"Here you can prompt users for various application permissions, providing them useful information about why you'd like those permissions to enhance their experience, increasing your chances they will grant those permissions." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
    firstPage.topPadding = 0;
    
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"I'm so sorry" body:@"I can't get over the nice blurry background photo." image:[UIImage imageNamed:@"tree"] buttonText:@"Connect With Facebook" action:^{
        [[[UIAlertView alloc] initWithTitle:nil message:@"Prompt users to do other cool things on startup. As you can see, hitting the action button on the prior page brought you automatically to the next page. Cool, huh?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
    secondPage.movesToNextViewController = YES;
    secondPage.viewDidAppearBlock = ^{
        [[[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"You've arrived on the second page, and this alert was displayed from within the page's viewDidAppearBlock." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    };
    
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"Seriously Though" body:@"Kudos to the photographer." image:[UIImage imageNamed:@"milky_way.jpg"] buttonText:@"Get Started" action:^{
        [self handleOnboardingCompletion];
    }];
    
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"street"] contents:@[firstPage, secondPage, thirdPage]];
    onboardingVC.shouldFadeTransitions = YES;
    onboardingVC.fadePageControlOnLastPage = YES;
    onboardingVC.fadeSkipButtonOnLastPage = YES;
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    onboardingVC.allowSkipping = YES;
    onboardingVC.skipHandler = ^{
        [self handleOnboardingCompletion];
    };
    
    return onboardingVC;
}

- (void)handleOnboardingCompletion {
    [self setupNormalRootViewController];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserHasOnboardedKey];
}

- (void)setupNormalRootViewController
{
    HQTabBarViewController *rootVC = [HQTabBarViewController shareInstance];
    self.window.rootViewController = rootVC;
}

@end
