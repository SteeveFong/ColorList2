//
//  PatternVC.m
//  ColorList2
//
//  Created by Steeve Fong on 3/29/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "PatternVC.h"
#import "PatternCell.h"
#import "Pattern.h"

@interface PatternVC ()
@property (weak, nonatomic) IBOutlet UICollectionView * myCollectionVw;
@property (weak, nonatomic) IBOutlet UISearchBar * mySearchBar;
@end

@implementation PatternVC
{
    NSMutableArray * myListItems;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if ([Pattern count] == 0) {
        [self fetchEntries:PATTERNLISTURL];
    }
    else {
        [myListItems addObjectsFromArray:[Pattern allRecords]];
        [_myCollectionVw reloadData];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    myListItems = [[NSMutableArray alloc] init];
    
    static NSString * cellIdentifier = @"PatternCell";
    
    [_myCollectionVw registerClass:[PatternCell class] forCellWithReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchEntries:(NSString *) urlStr
{
    NSURL        * url = [NSURL URLWithString:urlStr];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation * jsonRequest = [AFJSONRequestOperation
                                            JSONRequestOperationWithRequest:req
                                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
                                            {
                                                [myListItems removeAllObjects];
                                                [Pattern dropAllRecords];

                                                for (NSDictionary * row in JSON) {
                                                    Pattern * pattern = [[Pattern newRecord] initWithDict:row];
                                                    [pattern save];
                                                    
                                                    [myListItems addObject:pattern];
                                                }
                                                [_myCollectionVw reloadData];
                                                [SVProgressHUD showSuccessWithStatus:@"Done"];
                                            }
                                            
                                            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                            {
                                                [SVProgressHUD showErrorWithStatus:error.description];
                                            }];
    [SVProgressHUD showWithMaskType:2];
    [jsonRequest start];
}

- (void)filterContentForSearchText:(NSString *)searchText
{
    [self fetchEntries:[NSString stringWithFormat:@"%@&keywords=%@", PATTERNLISTURL, searchText]];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    if ([_mySearchBar isFirstResponder]) {
        [_mySearchBar resignFirstResponder];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self filterContentForSearchText:_mySearchBar.text];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PatternCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PatternCell" forIndexPath:indexPath];
    
    Pattern * pattern = myListItems[indexPath.row];

    cell = [cell initFromPattern:pattern];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return myListItems.count;
}

@end
