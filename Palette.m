//
//  Palette.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "Palette.h"

@implementation Palette
-(id)initWithDict:(NSDictionary *)currentPalette
{
    self = [super init];
    
    if (self) {
        self.id          = currentPalette[@"id"];
        _description     = currentPalette[@"userName"];
        _title           = currentPalette[@"title"];
        _paletteImageURL = currentPalette[@"imageUrl"];
    }
    return self;
}
@end
