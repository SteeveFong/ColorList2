//
//  ColorDetailsVC.m
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "UIColor+hexToColor.h"
#import "ColorDetailsVC.h"
#import "Color.h"

@implementation ColorDetailsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithColor:(NSDictionary *)currentColor
{
    self = [super init];
    
    if (self) {
        _myColor = currentColor;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_descriptionLabel setText:_myColor[@"userName"]];
    [_titleLabel setText:_myColor[@"title"]];
    [_hexColorLabel setText:_myColor[@"hex"]];
    [_colorView setBackgroundColor:[UIColor colorFromHexString:_myColor[@"hex"]]];
    [_hexColorLabel setTextColor:[UIColor invertedColorFromHexString:_myColor[@"hex"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
