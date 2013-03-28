//
//  Palette.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "Palette.h"

@implementation Palette
-(id)initWithDict:(NSDictionary *)currentColor
{
    self = [super init];
    
    if (self) {
        self.id          = currentColor[@"id"];
        _description     = currentColor[@"userName"];
        _title           = currentColor[@"title"];
        _paletteImageURL = currentColor[@"imageUrl"];
    }
    return self;
}
@end
