//
//  ColorCell.m
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//
#import "UIColor+hexToColor.h"
#import "ColorCell.h"
#import "ColorList.h"
#import "Color.h"

@implementation ColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ColorCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initFromColor:(Color *)currentColor
{
    self = [super init];
    
    if (self) {
        [_titleLabel setText:currentColor.title];
        [_descriptionLabel setText:currentColor.description];
        [_colorView setBackgroundColor:[UIColor colorFromHexString:currentColor.colorHex]];
    }
    
    return self;
}

@end
