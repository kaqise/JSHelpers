//
//  BaseTableView.h
//  Demo_03
//
//  Created by FengDing_Ping on 2017/7/31.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning 使用时只需将控制器遵守的协议UITableViewDataSource替换为BaseTableViewDataSource

@protocol BaseTableViewDataSource <UITableViewDataSource>

@required
- (void)fd_headerRefreshAction;//下拉事件处理
- (void)fd_footerRefreshAction;//下拉事件处理
@end

@interface BaseTableView : UITableView
//头部动画图片数组 设置即可  默认为文字
@property (nonatomic, strong) NSArray *headerGifs;
//尾部动画图片数组 设置即可  默认为文字
@property (nonatomic, strong) NSArray *footerGifs;
//覆盖父类数据源协议
@property (nonatomic, weak)id<BaseTableViewDataSource> dataSource;
//头视图刷新
- (void)refreshHeader;
//结束下拉刷新
- (void)endHeaderRefreshing;
//结束上拉加载
- (void)endFooterRefreshing;
//以没有数据的方式结束上拉加载
- (void)endFooterRefreshingNoMoreDatas;

@end

