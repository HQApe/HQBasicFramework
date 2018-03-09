# HQBasicFramework
这是搭建iOS项目所用的基本框架，UI，网络层，数据层等，持续完善。。。。


# 记录iOS相关问题的奇妙之处
1. `[A presentViewController:B]`可能存在延时跳转，或者再次点击才跳转
把它放在
``` Objective-C
dispatch_async(dispatch_get_main_queue(), ^{

});
```
中执行就没有问题了，有人说是需要触发主线程才能马上跳转。

2. `UITabBarController`或者`UINavigationController`的子控制器A,
`[A presentViewController:B];`
那么`B.presentingViewController = UITabBarController`或者`UINavigationController`

3. 若控制器A，`[A presentViewController:B];`B为`NavigationController`，
那么`NavigationController`的`RootViewController.presentingViewController = A.`
````
NavigationController.presentingViewController = A.
````

4. A在present多个控制器后到B，B想在一步回到A，可以用以下代码：
``` Objective-C
UIViewController *vc = self;
if (!vc.presentingViewController) {
return;
}
while (vc.presentingViewController) {
vc = vc.presentingViewController;
}
[vc dismissViewControllerAnimated:YES completion:nil];
```
这样得到的vc是A，因此也可以想办法拿到A后执行dismissViewControllerAnimated。
如果拿到A下一个控制器C，执行[C dismissViewControllerAnimated:YES completion:nil];
那么C依然没有被dismiss掉。

