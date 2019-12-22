//
//  DMServiceProxy.h
//  DatnaManagement
//
//  Created by user159106 on 12/1/19.
//  Copyright © 2019 user159106. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserOC.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMServiceProxy : NSObject

-(void)getAllUSers: (void (^)( UserOC *users))completion;
@end

NS_ASSUME_NONNULL_END
