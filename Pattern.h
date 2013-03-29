//
//  Pattern.h
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pattern : ActiveRecord
@property (strong, nonatomic) NSString * userName;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * imageUrl;

- (id)initWithDict:(NSDictionary *)dict;

@end
