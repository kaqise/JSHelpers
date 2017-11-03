//
//  BaseTableView.m
//  Demo_03
//
//  Created by FengDing_Ping on 2017/7/31.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "BaseTableView.h"
#import <MJRefresh.h>

@implementation BaseTableView
@dynamic dataSource;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
        header.lastUpdatedTimeLabel.hidden = YES;
        self.mj_header = header;
        
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction)];
        self.mj_footer = footer;
        
        
    }
    
    return self;
}

#pragma mark - 上拉下拉事件
- (void)headerAction{
    [self.dataSource fd_headerRefreshAction];
}

- (void)footerAction{
    [self.dataSource fd_footerRefreshAction];
}


#pragma mark - PublicFucs

- (void)refreshHeader{
    [self.mj_header beginRefreshing];
}
- (void)endHeaderRefreshing{
    [self reloadData];
    [self.mj_header endRefreshing];
}
- (void)endFooterRefreshing{
    [self reloadData];
    [self.mj_footer endRefreshing];
}
- (void)endFooterRefreshingNoMoreDatas{
    [self.mj_footer endRefreshingWithNoMoreData];
}



- (void)setHeaderGifs:(NSArray *)headerGifs{
    _headerGifs = headerGifs;
    
    if (headerGifs.count == 0) return;
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
    
    [header setImages:headerGifs forState:MJRefreshStateIdle];
    
    [header setImages:headerGifs forState:MJRefreshStatePulling];
    
    [header setImages:headerGifs forState:MJRefreshStateRefreshing];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    
    header.stateLabel.hidden = YES;
    
    self.mj_header = header;
    
}

- (void)setFooterGifs:(NSArray *)footerGifs{
    _footerGifs = footerGifs;
    
    if (footerGifs.count == 0) return;
    
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction)];
    [footer setImages:footerGifs forState:MJRefreshStateIdle];
    
    [footer setImages:footerGifs forState:MJRefreshStatePulling];
    
    [footer setImages:footerGifs forState:MJRefreshStateRefreshing];
    
    self.mj_footer = footer;
}



@end
