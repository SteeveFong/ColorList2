//
//  UIColor+hexToColor.h
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexToColor)
+ (UIColor *) colorFromHexString:(NSString *)hexString;
+ (UIColor *) invertedColorFromHexString:(NSString *)hexString;
@end
