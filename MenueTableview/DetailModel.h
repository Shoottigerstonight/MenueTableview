//
//  DetailModel.h
//  MenueTableview
//
//  Created by 函冰 on 2016/11/22.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject
/** 标题，内容   */
@property (nonatomic ,strong) NSString *title;
/** 是否展开   */
@property (nonatomic , assign) BOOL isOpen;
/** 数组   */
@property (nonatomic , copy) NSMutableArray *subTitle;
/** model的级别   */
@property (nonatomic , assign) NSInteger modelLeval;
/**
 判断这个模型里面应该展示的数据个数，也就是打开的数据的个数

 @return 数据的个数
 */
+ (NSInteger)numberOfOpen:(DetailModel *)model;

/**
 返回这个模型里面所有打开的模型数组

 @param model 需要查看的模型
 @return 模型里面所有打开的模型的数组
 */
+ (NSMutableArray *)subTitleOfOpen:(DetailModel *)model;
@end
