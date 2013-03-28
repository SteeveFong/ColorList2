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
        _userName  = [[array objectAtIndex:0] valueForKey:@"userName"];
        _location  = [[array objectAtIndex:0] valueForKey:@"location"];
        _rating    = [[array objectAtIndex:0] valueForKey:@"rating"];
        _numColors = [[array objectAtIndex:0] valueForKey:@"numColors"];
    }
    
    return self;
}

@end
