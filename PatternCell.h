//
//  PatternCell.h
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Pattern;

@interface PatternCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView * imageView;

- (id)initFromPattern:(Pattern *)currentPattern;

@end
