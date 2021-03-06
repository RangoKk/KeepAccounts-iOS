//
//  WRGOverviewView.m
//  KeepAccounts
//
//  Created by 王瑞果 on 2018/7/18.
//  Copyright © 2018年 王瑞果. All rights reserved.
//

#import "WRGOverviewView.h"

CGFloat const kSmallFontSize = 12.f;
CGFloat const kCommonFontSize = 15.f;
CGFloat const kBigFontSize = 30.f;

@interface WRGOverviewView ()
@property (nonatomic, strong) UILabel *expensesLabel;
@property (nonatomic, strong) UILabel *incomeLabel;
@property (nonatomic, strong) UILabel *bidgetLabel;
@end

@implementation WRGOverviewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupOverviewView];
    }
    return self;
}

- (void)setupOverviewView {
    self.backgroundColor = COLOR_COMMON_BLACK;
    
    UILabel *topTitleLabel = [UILabel labelWithFontSize:kCommonFontSize text:@"本月支出（元）"];
    [self addSubview:topTitleLabel];
    
    self.expensesLabel = [UILabel labelWithFontSize:kBigFontSize text:@"暂无支出"];
    [self addSubview:self.expensesLabel];
    
    UIView *leftView = [[UIView alloc] init];
    [self addSubview:leftView];
    
    UILabel *leftTitleLabel = [UILabel labelWithFontSize:kSmallFontSize text:@"本月收入"];
    [leftView addSubview:leftTitleLabel];
    
    self.incomeLabel = [UILabel labelWithFontSize:kSmallFontSize text:@"暂无收入"];
    [leftView addSubview:self.incomeLabel];
    
    UIView *rightView = [[UIView alloc] init];
    [self addSubview:rightView];
    
    UILabel *rightTitleLabel = [UILabel labelWithFontSize:kSmallFontSize text:@"预算剩余"];
    [rightView addSubview:rightTitleLabel];
    
    self.bidgetLabel = [UILabel labelWithFontSize:kSmallFontSize text:@"暂无"];
    [rightView addSubview:self.bidgetLabel];
    
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).inset(kMargin * 5 + kTopSafeHeight);
        make.left.equalTo(self).inset(kMargin);
    }];
    
    [self.expensesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topTitleLabel.mas_bottom).offset(kMargin);
        make.left.equalTo(self).inset(kMargin);
    }];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.expensesLabel.mas_bottom).inset(kMargin * 1.5f);
        make.left.equalTo(self).inset(kMargin);
        make.bottom.equalTo(leftTitleLabel.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).inset(kMargin * 2.f);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_top);
        make.left.equalTo(leftView.mas_right).inset(kMargin);
        make.right.equalTo(self).inset(kMargin);
        make.width.height.equalTo(leftView);
    }];
    
    [leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(leftView);
        make.right.equalTo(self.incomeLabel.mas_left).inset(kMargin);
        make.width.priority(MASLayoutPriorityDefaultMedium);
    }];

    [self.incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(leftView);
    }];

    [rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(rightView);
        make.right.equalTo(self.bidgetLabel.mas_left).inset(kMargin);
        make.width.priority(MASLayoutPriorityDefaultMedium);
    }];

    [self.bidgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(rightView);
    }];
    
}

- (void)reloadData:(NSString *)data {
    self.expensesLabel.text = data;
    self.bidgetLabel.text = data;
    self.incomeLabel.text = data;
}

@end
