//
//  LabelSectionController.h
//  zues
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 v. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@interface LabelSectionController : IGListSectionController<IGListSectionType>
@property (nonatomic,strong) NSString *object;
@end
