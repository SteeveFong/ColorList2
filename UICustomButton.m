//
//  UICustomButton.m
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "UICustomButton.h"

@implementation UICustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIImage * backImg = [[UIImage imageNamed:@"button.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    [self setBackgroundImage:backImg forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
