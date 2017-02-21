//
//  SearchViewController.m
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "SearchViewController.h"
#import "LabelSectionController.h"

@interface SearchViewController ()<IGListAdapterDataSource>
/** <#注释#> */
@property (strong, nonatomic) IGListAdapter *adapter;
/** <#注释#> */
@property (strong, nonatomic) NSMutableArray *words;
/** <#注释#> */
@property (strong, nonatomic) NSString *filterString;

@property (strong, nonatomic) IGListCollectionView *collectionView;
/** <#注释#> */
@property (strong, nonatomic) NSNumber *searchToken;
@end

@implementation SearchViewController

-(IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (IGListCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    }
    return _collectionView;
}

- (NSMutableArray *)words{
    if (!_words) {
        NSString *str = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";
        _words = [NSMutableArray array];
        [str enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            [_words addObject:substring];
        }];
    }
    return _words;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchToken = @42;
    self.filterString = @"";
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = _collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

// MARK: IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *arrM=[NSMutableArray arrayWithObject:_searchToken];
    if ([self.filterString isEqualToString:@""]) {
        [arrM addObjectsFromArray:self.words];
    }
    else{
        for (NSString *str in self.words) {
            if ([str.lowercaseString containsString:_filterString.lowercaseString]) {
                [arrM addObject:str];
            }
        }
    }
    return arrM;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    NSNumber *obj = object;
    if (obj == _searchToken) {
        SearchSectionController *sectionController = [[SearchSectionController alloc] init];
        sectionController.delegate = self;
        return sectionController;
    }
    
    return [LabelSectionController new];
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

// MARK：SearchSectionControllerDelegate
- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text {
    self.filterString = text;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

@end
