//
//  Entity.m
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

#import "UserOC.h"

@implementation UserOC

- (instancetype)initWithData:(NSString *)name :(NSString * )userID
{
    self = [super init];
    if (self) {
        _name = name;
        _userId = userID;
    }
    return self;
}


@end
