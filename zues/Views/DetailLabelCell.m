//
//  DetailLabelCell.m
//  zues
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "DetailLabelCell.h"

@implementation DetailLabelCell

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:17.0];
        _titleLabel.textColor = [UIColor darkTextColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.font = [UIFont systemFontOfSize:17.0];
        _detailLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

CGFloat padding=15.0;

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = CGRectInset(self.contentView.bounds, padding, 0);
    _titleLabel.frame = frame;
    _detailLabel.frame = frame;
}

@end
