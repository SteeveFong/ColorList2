//
//  ViewController.h
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFJSONRequestOperation;
@class SBJsonParser;
@class ColorList;

@protocol SBJsonStreamParserDelegate;

@interface ColorListVC : UIViewController
<UITableViewDelegate, UITableViewDataSource, SBJsonStreamParserDelegate>

- (void)fetchEntries;

@end
