//
//  DetailTableViewCell.h
//  MenueTableview
//
//  Created by 函冰 on 2016/11/23.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailModel;
@class DetailView;
@interface DetailTableViewCell : UITableViewCell

/**  DetailVi  */
@property (nonatomic ,strong) DetailModel *dm;

/** self.dv   */
@property (nonatomic ,strong) DetailView *dv;
@end
