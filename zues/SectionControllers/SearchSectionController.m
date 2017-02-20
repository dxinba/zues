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

// MARK: UISearchBarDelegate
- (void)listAdapter:(IGListAdapter *)listAdapter didScrollSectionController:(IGListSectionController<IGListSectionType> *)sectionController {
    UISearchBar *searchBar = [[UISearchBar alloc]init];
//    if (searchBar == [self.collectionContext cellForItemAtIndex:0 sectionController:self] ) {
//        searchBar.text = @"";
//        [searchBar resignFirstResponder];
//    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter willBeginDraggingSectionController:(IGListSectionController<IGListSectionType> *)sectionController {
    
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDraggingSectionController:(IGListSectionController<IGListSectionType> *)sectionController willDecelerate:(BOOL)decelerate {
    
}



@end
