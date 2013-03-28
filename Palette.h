//
//  Palette.h
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palette : ActiveRecord
@property (strong, nonatomic) NSString * description;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * paletteImageURL;

- (id)initWithDict:(NSDictionary *)currentPalette;
@end
