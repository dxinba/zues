//
//  ExpandableSectionController.h
//  zues
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@interface ExpandableSectionController : IGListSectionController<IGListSectionType>
@property (nonatomic,assign) BOOL expanded;
@property (nonatomic,strong) NSString *object;
@end
