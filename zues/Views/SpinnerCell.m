//
//  SpinnerCell.m
//  zues
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SpinnerCell.h"

@implementation SpinnerCell

- (UIActivityIndicatorView *)activityIndicator {
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.contentView addSubview:_activityIndicator];
    }
    return _activityIndicator;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds=self.bounds;
    self.activityIndicator.center=CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}
@end
