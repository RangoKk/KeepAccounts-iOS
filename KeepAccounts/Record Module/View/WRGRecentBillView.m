//
//  WRGRecentBillView.m
//  KeepAccounts
//
//  Created by 王瑞果 on 2018/7/23.
//  Copyright © 2018年 王瑞果. All rights reserved.
//

#import "WRGRecentBillView.h"


static CGFloat const margin = 10.f;
static CGFloat const smallFontSize = 15.f;


@interface WRGRecentBillView ()
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UIButton *button;
@end


@implementation WRGRecentBillView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRecentlyBillView];
    }
    return self;
}

- (void)setupRecentlyBillView {
    self.backgroundColor = COLOR_BG_WHITE;
    
    UILabel *topTitleLabel = [UILabel labelWithFontSize:smallFontSize text:@"最近三日新增账单"];
    [self addSubview:topTitleLabel];
    topTitleLabel.textColor = COLOR_TEXT_BLACK;
    
    self.amountLabel = [UILabel labelWithFontSize:smallFontSize text:@"0笔"];
    [self addSubview:self.amountLabel];
    self.amountLabel.textColor = COLOR_TEXT_GRAY;
    
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).inset(margin);
    }];
    
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).inset(margin);
        make.left.equalTo(topTitleLabel.mas_right).offset(margin);
    }];
}

@end
