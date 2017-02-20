//
//  SearchViewController.m
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()


@property (strong, nonatomic) IGListCollectionView *collectionView;
/** <#注释#> */
@property (strong, nonatomic) NSNumber *searchToken;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView = [[IGListCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    [self.view addSubview:_collectionView];
    _adapter.collectionView = _collectionView;
    _adapter.dataSource = self;
    
    _searchToken = @42;
}

- (IGListAdapter *)adapter {
    return [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
}

- (NSString *)filterString {
    return @"";
}

- (NSString *)words{
    NSString *str = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";
    NSMutableString *words = [NSMutableString string];
//    NSRange range = str.length;
//    [str enumerateSubstringsInRange:range options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
//        
//    }];
    return nil;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

// MARK: IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
//    guard filterString != "" else { return [searchToken] + words.map { $0 as IGListDiffable } }
//    return [searchToken] + words.filter { $0.lowercased().contains(filterString.lowercased()) }.map { $0 as IGListDiffable }
    return @[@0];
}

//- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
//    id obj = object;
//    if (obj == object) {
//        SearchSectionController *sectionController = [[SearchSectionController alloc]init];
//        sectionController.delegate = self;
//        return sectionController;
//    }
//}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

// MARK：SearchSectionControllerDelegate


@end
