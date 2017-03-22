//
//  TBBBulletinView.m
//  BulletinView
//
//  Created by 唐彬彬 on 2017/3/20.
//  Copyright © 2017年 唐彬彬. All rights reserved.
//

#import "TBBBulletinView.h"

@interface TBBBulletinView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArr;//要展示的数据源
@property (nonatomic,strong) NSArray *urlArr;//跳转页面url数组
@property (nonatomic,assign) CGFloat cellHight;//cell高度
@property (nonatomic,assign) NSIndexPath* indexPath;//当前cell所在的row
@property (nonatomic,assign) NSInteger index;//cell排序
@end

static CGFloat cellhight = 40.0;
static  NSString *cellIdentifil = @"cell";
@implementation TBBBulletinView


-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)dataArray urlArray:(NSArray *)urlArray{

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.dataArr = dataArray;
        self.urlArr = urlArray;
      
        self.tableView = [[UITableView alloc]init];
        self.tableView.frame = self.bounds;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.scrollEnabled = NO;
        [self addSubview:self.tableView];
        
        [self startTimer];

    }
    return self;
}


/**
 *  开始定时器
 */
-(void)startTimer
{
   
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(nextPage)];
    link.preferredFramesPerSecond = 1;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
  
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    
//    //通知主线程
//    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/**
 *  下一页
 */
-(void)nextPage
{
    //判断cell当前高度
    if (self.cellHight >= cellhight*self.dataArr.count) {
        
        //设置tableView偏移量
        [self.tableView setContentOffset:CGPointMake(0,0 ) animated:NO];
        self.cellHight = cellhight;
    } else {
            
            [self.tableView setContentOffset:CGPointMake(0,self.cellHight ) animated:YES];
            self.cellHight = self.cellHight + cellhight;
        }
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellhight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifil];
    if (cell == nil) {
        
      cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifil];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *urlStr = self.urlArr[indexPath.row];
    
    // 点击跳转到相应页面
    if (self.myBlcok) {
        self.myBlcok(urlStr);
    }
    
}

-(void)didSelectTocController:(urlBlock)block{

    self.myBlcok = block;
}
@end
