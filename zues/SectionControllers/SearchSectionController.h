//
//  SearchSectionController.h
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class SearchSectionController;
@protocol SearchSectionControllerDelegate <NSObject>

- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text;

@end

@interface SearchSectionController : IGListSectionController<IGListSectionType, UISearchBarDelegate, IGListScrollDelegate>

/**  */
@property (weak, nonatomic) id<SearchSectionControllerDelegate> delegate;

@end

