//
//  ColorDetailsVC.h
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Color;

@interface ColorDetailsVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView * colorView;
@property (strong, nonatomic) IBOutlet UILabel * titleLabel;
@property (strong, nonatomic) IBOutlet UILabel * hexColorLabel;
@property (strong, nonatomic) IBOutlet UILabel * descriptionLabel;
@property (strong, nonatomic) NSDictionary * myColor;

-(id)initWithColor:(NSDictionary *)currentColor;
@end
