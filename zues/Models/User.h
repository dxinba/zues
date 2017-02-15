//
//  User.h
//  zues
//
//  Created by v on 17/2/13.
//  Copyright © 2017年 v. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
@interface User : NSObject<IGListDiffable>

@property (strong, nonatomic) NSNumber *pk;

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *handle;

@end
