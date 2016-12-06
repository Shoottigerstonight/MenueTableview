//
//  DetailView.m
//  MenueTableview
//
//  Created by 函冰 on 2016/11/21.
//  Copyright © 2016年 今晚打老虎. All rights reserved.
//

#import "DetailView.h"
#import "DetailModel.h"

@interface DetailView ()
/** label   */
@property (nonatomic ,strong) UILabel *label;
@end

@implementation DetailView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DetailViewClick:)];
        [self addGestureRecognizer:tap];
        self.isOpen = NO;
       
    }
    return self;
}
- (void)layoutSubviews
{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.label.textColor = [UIColor redColor];
    self.label.backgroundColor = [UIColor darkGrayColor];
    self.label.text = [NSString stringWithFormat:@"%@ + %ld",self.title,self.model.modelLeval];
    self.label.userInteractionEnabled = YES;
    [self addSubview:self.label];

}
- (void)setModel:(DetailModel *)model
{
    _model = model;
    _title = _model.title;
    _label.text = [NSString stringWithFormat:@"%@ + %ld",model.title,model.modelLeval];
    _isOpen = _model.isOpen;
}

/**
 触摸事件调用代理事件

 @param tap tap
 */
- (void)DetailViewClick:(UITapGestureRecognizer *)tap
{
    self.isOpen = !self.isOpen;
    [_delegate DetailView:(DetailView *)tap.view IsOpen:self.isOpen];
}
@end
