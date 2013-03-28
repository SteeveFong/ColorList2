//
//  PaletteCell.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "PaletteCell.h"
#import "Palette.h"

@implementation PaletteCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PaletteCell" owner:self options:nil];
        self = nib[0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initFromPalette:(Palette *)currentPalette
{
    self = [super init];
    
    if (self) {
        MACachedImageView * cachedImageView = [[MACachedImageView alloc] initWithFrame:CGRectMake(0,0,60,60)];
        NSURL *url = [NSURL URLWithString:currentPalette.paletteImageURL];
        
        [cachedImageView setImageWithURL:url];
        
        [_titleLabel setText:currentPalette.title];
        [_descriptionLabel setText:currentPalette.description];
        [_paletteImageView setImageWithURL:url];
    }
    
    return self;
}

@end
