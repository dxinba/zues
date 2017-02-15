//
//  ExpandableSectionController.m
//  zues
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "ExpandableSectionController.h"
#import "LabelCell.h"

@implementation ExpandableSectionController
-(NSInteger)numberOfItems{
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width=[self.collectionContext containerSize].width;
    CGFloat height = _expanded ? [LabelCell textHeight:_object?:@"" width:width] : LabelCell.singleLineHeight;
    return CGSizeMake(width, height);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    LabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.numberOfLines = _expanded ? 0 : 1;
    cell.label.text = _object;
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object=object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    _expanded = !_expanded;
    [self.collectionContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:0]];
}
@end
