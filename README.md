# BulletinView
京东，淘宝快报效果
##使用步骤:
```
1.在控制器引入 “TBBBulletinView.h“
2.初始化TBBBulletinView时需要传入两个参数：显示信息的数据数组dataArray与点击跳转页面url数组的urlArray
3.调用TBBBulletinView的方法-(void)didSelectTocController:(urlBlock)block在block设置跳转页面与url进行页面跳转
```
**************************主要代码****************************
NSArray *dataArr = @[@"第一个快报消息",@"第二个快报消息",@"第三个快报消息",@"第四个快报消息"];
NSArray *urlArray = @[@"https://www.baidu.com",
                    @"http://www.163.com",
                    @"http://www.youku.com",
                    @"http://www.apple.com/cn/"];
TBBBulletinView *bView = [[TBBBulletinView alloc]initWithFrame:CGRectMake(0, 64.f, [UIScreen mainScreen].bounds.size.width, 40.f) titleArray:dataArr urlArray:urlArray];

[bView didSelectTocController:^(NSString *string) {
//需要跳转到的控制器
TestViewController *tVC = [[TestViewController alloc]init];
tVC.urlString = string;
[self.navigationController pushViewController:tVC animated:YES];

}];


