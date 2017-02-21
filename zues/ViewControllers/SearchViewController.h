//
//  SearchViewController.h
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "SearchSectionController.h"
@interface SearchViewController : UIViewController<IGListAdapterDataSource, SearchSectionControllerDelegate>
/** <#注释#> */
@property (strong, nonatomic) IGListAdapter *adapter;
/** <#注释#> */
@property (strong, nonatomic) NSArray *words;
/** <#注释#> */
@property (strong, nonatomic) NSString *filterString;
@end
