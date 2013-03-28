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

@interface ColorListVC : UIViewController
<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

- (void)fetchEntries:(NSString *) urlStr;
- (void)filterContentForSearchText:(NSString *) searchText;

@end
