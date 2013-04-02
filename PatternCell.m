//
//  PatternCell.m
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "PatternCell.h"
#import "Pattern.h"

@implementation PatternCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PatternCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

- (id)initFromPattern:(Pattern *)currentPattern
{
    self = [super init];
    
    if (self) {
        NSURL * url = [[NSURL alloc] initWithString:currentPattern.imageUrl];

        [_imageView setImageWithURL:url];
    }
    return self;
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
