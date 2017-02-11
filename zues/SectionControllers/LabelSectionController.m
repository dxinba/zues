//
//  LabelSectionController.m
//  zues
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 v. All rights reserved.
//

#import "LabelSectionController.h"
#import "LabelCell.h"

@implementation LabelSectionController

// MARK: IGListSectionType
-(NSInteger)numberOfItems{
    //相当于UITableView一个indexPath.setion中有几个row
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    //返回cell大小
    return CGSizeMake([self.collectionContext containerSize].width, 55);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    //返回cell
    LabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.text=_object;
    return cell;
}

-(void)didUpdateToObject:(id)object{
    //绑定model
    _object=object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    //一个row的点击事件
    return;
}
@end
