//
//  SearchCell.m
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (UISearchBar *)searchBar {
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar = self.searchBar;
    [self.contentView addSubview:searchBar];
    return searchBar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.searchBar.frame = self.contentView.bounds;
}



@end
