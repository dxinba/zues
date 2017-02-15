//
//  SearchSectionController.m
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SearchSectionController.h"
#import "SearchCell.h"
@implementation SearchSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDelegate = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 44);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SearchCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SearchCell class] forSectionController:self atIndex:index];
    if (cell) {
        cell.searchBar.delegate = self;
    }
    return cell;
}

- (void)didUpdateToObject:(id)object { }

- (void)didSelectItemAtIndex:(NSInteger)index { }



@end
