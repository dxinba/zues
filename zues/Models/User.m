//
//  User.m
//  zues
//
//  Created by v on 17/2/13.
//  Copyright © 2017年 v. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithPk:(NSNumber *)pk name:(NSString *)name handle:(NSString *)handle {
    if (self) {
        self.pk = pk;
        self.name = name;
        self.handle = handle;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return _pk;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
//    User *right = object;
    return NO;
}

@end
