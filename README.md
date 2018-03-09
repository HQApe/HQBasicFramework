# HQBasicFramework
这是搭建iOS项目所用的基本框架，UI，网络层，数据层等，持续完善。。。。


# 记录iOS相关问题的奇妙之处
1. [A presentViewController:B]可能存在延时跳转，或者再次点击才跳转
把它放在
dispatch_async(dispatch_get_main_queue(), ^{
});
中执行就没有问题了，有人说是需要触发主线程才能马上跳转。

2. UITabBarController或者UINavigationController的子控制器A,
[A presentViewController:B];
那么B.presentingViewController = UITabBarController或者UINavigationController

3. 若控制器A，[A presentViewController:B];B为NavigationController，
那么NavigationController的RootViewController.presentingViewController = A.
NavigationController.presentingViewController = A.

