//
//  UserSectionController.h
//  zues
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class User;
@interface UserSectionController : IGListSectionController<IGListSectionType>
@property (nonatomic,strong) User *user;
@end
