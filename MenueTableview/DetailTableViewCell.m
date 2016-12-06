//
//  DetailTableViewCell.m
//  MenueTableview
//
//  Created by 函冰 on 2016/11/23.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "DetailView.h"

@interface DetailTableViewCell ()

@end

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.dv = [[DetailView alloc] init];
        self.dv.frame = CGRectMake(50, 0, 320, 30);
        
    }
    return self;
}
- (void)layoutSubviews
{
    [self.contentView addSubview:self.dv];
    self.dv.model = self.dm;
}
- (void)setDm:(DetailModel *)dm
{
    _dm = dm;
    _dv.model = dm;
    
}
@end
