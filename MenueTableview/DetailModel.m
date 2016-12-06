//
//  DetailModel.m
//  MenueTableview
//
//  Created by 函冰 on 2016/11/22.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setSubTitle:(NSMutableArray *)subTitle
{
    NSMutableArray *subs = [NSMutableArray array];
    if ([subTitle  isEqual: @""]) {
        [subs removeAllObjects];
        return ;
    }
    
    for (NSDictionary *dic in subTitle) {
        DetailModel *dm = [[DetailModel alloc] init];
        [dm setValuesForKeysWithDictionary:dic];
        [subs addObject:dm];
    }
    _subTitle = subs;
}
+ (NSInteger)numberOfOpen:(DetailModel *)model
{
    NSInteger num = 0;
//    1.计算model的子标题的个数
    num = model.isOpen ? model.subTitle.count : 0;
//    2.判断model是否为打开状态，若是的话进行递归操作
    if (num) {
        for (DetailModel *submodel in model.subTitle) {
            num += [DetailModel numberOfOpen:submodel];
        }
    }
    return num;
}

+ (NSMutableArray *)subTitleOfOpen:(DetailModel *)model
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger num = 0;
//    1.若果是打开状态就直接将子标题数组添加到需要返回的数组里面
    if (model.isOpen) {
        [array addObjectsFromArray:model.subTitle];
//    2.便利数组查看数组模型中是否都为打开状态
        for (NSInteger i = 0; i < model.subTitle.count; i ++) {
            DetailModel *submodel = model.subTitle[i];
//            3.进行递归查询，子标题是否为打开状态
            NSMutableArray *dmsA = [DetailModel subTitleOfOpen:submodel];
           
            if (dmsA.count) {
                for (NSInteger j = 0; j < dmsA.count; j ++) {
                    num ++;
                    DetailModel *detailModel = dmsA[j];
//                    判断需要添加模型的位置，若是最后面则进行add操作，若是中间的就进行insert操作
                    if (num + i + 1 > array.count) {
                        [array addObject:detailModel];
                    } else {
                        [array insertObject:detailModel atIndex:num + i];
                    }
                    
                }
            }
        }
    }
    return array;
}
@end
