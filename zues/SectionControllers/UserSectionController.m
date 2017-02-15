//
//  UserSectionController.m
//  zues
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UserSectionController.h"
#import "User.h"
#import "DetailLabelCell.h"

@implementation UserSectionController
-(NSInteger)numberOfItems{
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 55);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    DetailLabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[DetailLabelCell class] forSectionController:self atIndex:index];
    cell.titleLabel.text=_user.name;
    cell.detailLabel.text=[NSString stringWithFormat:@"@%@",_user.handle];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _user=object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    return;
}

@end
