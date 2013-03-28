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
@property (strong, nonatomic) IBOutlet UILabel * titleLabel;
@property (strong, nonatomic) IBOutlet UILabel * descriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView * paletteImageView;

- (id)initFromPalette:(Palette *)currentPalette;

@end
