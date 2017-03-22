//
//  TBBBulletinView.h
//  BulletinView
//
//  Created by 唐彬彬 on 2017/3/20.
//  Copyright © 2017年 唐彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^urlBlock)(NSString*);
@interface TBBBulletinView : UIView
@property (nonatomic,strong) UITableView *tableView;//快报view
@property (nonatomic,copy) urlBlock myBlcok;
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)dataArray urlArray:(NSArray *)urlArray;
-(void)didSelectTocController:(urlBlock)block;
@end
