//
//  ViewController.m
//  BulletinView
//
//  Created by 唐彬彬 on 2017/3/20.
//  Copyright © 2017年 唐彬彬. All rights reserved.
//

#import "ViewController.h"
#import "TBBBulletinView.h"
#import "TestViewController.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"快报效果模拟";
      NSArray *dataArr = @[@"第一个快报消息",@"第二个快报消息",@"第三个快报消息",@"第四个快报消息"];
      NSArray *urlArray = @[@"https://www.baidu.com",
                            @"http://www.163.com",
                            @"http://www.youku.com",
                            @"http://www.apple.com/cn/"];
    TBBBulletinView *bView = [[TBBBulletinView alloc]initWithFrame:CGRectMake(0, 64.f, [UIScreen mainScreen].bounds.size.width, 40.f) titleArray:dataArr urlArray:urlArray];
    [self.view addSubview:bView];
    
    [bView didSelectTocController:^(NSString *string) {
        TestViewController *tVC = [[TestViewController alloc]init];
        tVC.urlString = string;
        [self.navigationController pushViewController:tVC animated:YES];
        
    }];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
