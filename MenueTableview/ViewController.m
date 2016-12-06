//
//  ViewController.m
//  MenueTableview
//
//  Created by 函冰 on 2016/11/21.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import "ViewController.h"
#import "DetailView.h"
#import "DetailModel.h"
#import "DetailTableViewCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,DetailViewDelegate>

/** 用于显示数据的表格   */
@property (nonatomic ,strong) UITableView *tableView;
/** 数据源   */
@property (nonatomic , copy) NSMutableArray *array;

/** 菜单的级数   */
@property (nonatomic , assign) NSInteger menuLeval;
/** dms的数组   */
@property (nonatomic , copy) NSMutableArray *dmsArray;
@end

@implementation ViewController

//懒加载一个数组
- (NSMutableArray *)array
{
    if (!_array) {
        //创建一个属性
        _array = [NSMutableArray array];
    }
    return  _array;
}
- (NSMutableArray *)dmsArray
{
    if (!_dmsArray) {
        //创建一个属性
        _dmsArray = [NSMutableArray array];
    }
    return  _dmsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *dataArray = @[@{@"title" : @"北京市",
                           @"isOpen" : @0,
                             @"subTitle" : @[@{@"title" : @"海淀区",
                                               @"isOpen" : @0,
                                               @"subTitle" :@[@{@"title" : @"上地",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""},
                                                              @{@"title" : @"清河",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""},
                                                              @{@"title" : @"肖家河",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @[@{@"title" : @"上地",
                                                                                  @"isOpen" : @0,
                                                                                  @"subTitle" : @""},
                                                                                @{@"title" : @"清河",
                                                                                  @"isOpen" : @0,
                                                                                  @"subTitle" : @""},
                                                                                @{@"title" : @"肖家河",
                                                                                  @"isOpen" : @0,
                                                                                  @"subTitle" : @""},
                                                                                @{@"title" : @"中关村",
                                                                                  @"isOpen" : @0,
                                                                                  @"subTitle" : @""}
                                                                                ]},
                                                              @{@"title" : @"中关村",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""}
                                                              ]},
                                             @{@"title" : @"朝阳区",
                                               @"isOpen" : @0,
                                               @"subTitle" :@[@{@"title" : @"双井",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""},
                                                              @{@"title" : @"呼家楼",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""},
                                                              @{@"title" : @"惠新西街",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""},
                                                              @{@"title" : @"亮马桥",
                                                                @"isOpen" : @0,
                                                                @"subTitle" : @""}
                                                              ]}
                                             ]
                           },
                         @{@"title" : @"郑州市",
                           @"isOpen" : @0,
                           @"subTitle" : @[@{@"title" : @"管城区",
                                             @"isOpen" : @0,
                                             @"subTitle" :@[@{@"title" : @"正商蓝钻",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"陈庄",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"二里岗",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"火车站",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            
                                                            
                                                            ]},
                                           @{@"title" : @"郑东新区",
                                             @"isOpen" : @0,
                                             @"subTitle" :@[@{@"title" : @"曼哈顿广场",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"楼张",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"庙里",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                            @{@"title" : @"龙子湖",
                                                              @"isOpen" : @0,
                                                              @"subTitle" : @""},
                                                         ]}
                                           ],
                           }];
    

    
    for (NSDictionary *dic in dataArray) {
        DetailModel *dm = [[DetailModel alloc] init];
        [dm setValuesForKeysWithDictionary:dic];
        [self.array addObject:dm];
    }
    NSLog(@"%@",self.array);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}
#pragma mark  ----  表格的代理方法以及数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.array.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DetailModel *dm = self.array[section];
    NSInteger ss = [DetailModel numberOfOpen:dm];
    NSLog(@"这组里面有%ld",ss);
    return ss;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailModel *dm = self.array[indexPath.section];
    self.dmsArray = [DetailModel subTitleOfOpen:dm];
    DetailModel *dms = self.dmsArray[indexPath.row];
    
    NSString *cell_normal = @"cell_normal";
    NSString *cell_detail = @"cell_Detail";
    if (dms.subTitle == nil) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_normal];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_normal];
        }
        cell.textLabel.text = dms.title;
        return cell;
    } else {
        DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_detail];
        if (!cell) {
            cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_detail];
        }
        cell.dm = dms;
        cell.dv.delegate = self;
        return cell;
    }
   
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DetailModel *dm = self.array[section];
    DetailView *dv = [[DetailView alloc] init];
    dv.model = dm;
    dv.delegate = self;
    return dv;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
#pragma mark   --- 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}
#pragma mark   --- DetailView的代理事件
- (void)DetailView:(DetailView *)dv IsOpen:(BOOL)isOpen
{
    NSLog(@"----delegate-----%d--%@",isOpen,dv.model);
    dv.model.isOpen = isOpen;
    [self.tableView reloadData];
}
@end
