//
//  UserDetails.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initUserWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        _userName  = dict[@"userName"];
        _location  = dict[@"location"];
        _rating    = dict[@"rating"];
        _numColors = dict[@"numColors"];
    }
    
    return self;
}

- (id)initUserWithArray:(NSArray *)array
{
    self = [super init];
    
    if (self) {
        _userName  = [array valueForKey:@"userName"];
        _location  = [array valueForKey:@"location"];
        _rating    = [array valueForKey:@"rating"];
        _numColors = [array valueForKey:@"numColors"];
    }
    
    return self;
}

@end
