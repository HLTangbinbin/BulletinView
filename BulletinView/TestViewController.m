//
//  TestViewController.m
//  BulletinView
//
//  Created by 唐彬彬 on 2017/3/21.
//  Copyright © 2017年 唐彬彬. All rights reserved.
//

#import "TestViewController.h"
#import "TBBBulletinView.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@interface TestViewController ()
@property (nonatomic ,strong) TBBBulletinView *bView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    //跳转到相应的页面
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    [self.view addSubview:self.webView];
}

-(void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
}

@end
