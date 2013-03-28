//
//  ColorCell.h
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Color;
@interface ColorCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel * titleLabel;
@property (strong, nonatomic) IBOutlet UILabel * descriptionLabel;
@property (strong, nonatomic) IBOutlet UIView * colorView;

- (id)initFromColor:(Color *)currentColor;

@end
