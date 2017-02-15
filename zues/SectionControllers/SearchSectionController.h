//
//  SearchSectionController.h
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@protocol SearchSectionControllerDelegate <NSObject>



@end
@interface SearchSectionController : IGListSectionController<IGListSectionType, UISearchBarDelegate, IGListScrollDelegate>

/** <#注释#> */
@property (weak, nonatomic) id<SearchSectionControllerDelegate> delegate;

@end

