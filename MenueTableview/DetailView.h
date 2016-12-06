//
//  DetailView.h
//  MenueTableview
//
//  Created by 函冰 on 2016/11/21.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailModel;
@class DetailView;

@protocol DetailViewDelegate <NSObject>

- (void)DetailView:(DetailView *)dv IsOpen:(BOOL)isOpen;

@end

@interface DetailView : UIView
/** 标题，内容   */
@property (nonatomic ,strong) NSString *title;
/** 是否展开   */
@property (nonatomic , assign) BOOL isOpen;
/** 所在的表格   */
@property (nonatomic ,strong) UITableView *tabble;
/** view对应的数据模型   */
@property (nonatomic ,strong) DetailModel *model;
/** 协议的属性   */
@property (nonatomic , assign) id<DetailViewDelegate> delegate;
@end
