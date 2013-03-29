//
//  Pattern.m
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "Pattern.h"

@implementation Pattern
- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        _title = dict[@"title"];
        _userName = dict[@"userName"];
        _imageUrl = dict[@"imageUrl"];
    }
    return self;
}
@end
