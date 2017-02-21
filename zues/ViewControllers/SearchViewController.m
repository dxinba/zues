//
//  SearchViewController.m
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SearchViewController.h"
#import "LabelSectionController.h"
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
    self.filterString = @"";
}

- (IGListAdapter *)adapter {
    return [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
}

- (NSString *)filterString {
    return @"";
}

- (NSArray *)words{
    NSString *str = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";
    NSMutableArray *words = [NSMutableArray array];
    NSString *subString = @" ";
    [str enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [words addObject:subString];
    }];
    return words;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

// MARK: IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    if ([self.filterString isEqualToString:@""]) {
        NSArray *arr = [NSArray arrayWithObjects:_searchToken, _words[0], nil];
        return arr;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:_searchToken, nil];
    for (NSString *filter in _words) {
        if ([filter.lowercaseString isEqualToString:_filterString.lowercaseString]) {
            [arr addObject:filter];
        }
    }
    return arr;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    NSNumber *obj = object;
    if (obj == _searchToken) {
        SearchSectionController *sectionController = [[SearchSectionController alloc]init];
        sectionController.delegate = self;
        return sectionController;
    }
    else return [LabelSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

// MARK：SearchSectionControllerDelegate

- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text {
    self.filterString = text;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

@end
