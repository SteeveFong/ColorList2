//
//  Color.m
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "Color.h"

@interface Color ()

@end

@implementation Color

-(id)initWithDict:(NSDictionary *)currentColor
{
    self = [super init];
    
    if (self) {
        self.id      = currentColor[@"id"];
        _description = currentColor[@"userName"];
        _title       = currentColor[@"title"];
        _colorHex    = currentColor[@"hex"];
    }
    return self;
}
@end
