//
//  PaletteCell.h
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Palette;

@interface PaletteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * descriptionLabel;
@property (weak, nonatomic) IBOutlet MACachedImageView * paletteImageView;

- (id)initFromPalette:(Palette *)currentPalette;

@end
