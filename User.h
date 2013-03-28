//
//  UserDetails.h
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : ActiveRecord
@property (strong, nonatomic) NSString * userName;
@property (strong, nonatomic) NSString * location;
@property (strong, nonatomic) NSString * rating;
@property (strong, nonatomic) NSString * numColors;

- (id)initUserWithDict:(NSDictionary *)dict;
- (id)initUserWithArray:(NSArray *)array;

@end
