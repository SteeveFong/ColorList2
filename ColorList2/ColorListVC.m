//
//  ViewController.m
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "ColorDetailsVC.h"
#import "ColorListVC.h"
#import "ColorCell.h"
#import "ColorList.h"
#import "Color.h"

@interface ColorListVC ()
    @property (weak, nonatomic) IBOutlet UITableView * myTable;
    @property (weak, nonatomic) IBOutlet UISearchBar * mySearchBar;
@end

@implementation ColorListVC
{
    NSMutableArray * myColorListItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myColorListItems = [[NSMutableArray alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if ([Color count] == 0) {
        [self fetchEntries:COLORLISTURL];
    }
    else {
        [myColorListItems addObjectsFromArray:[Color allRecords]];
        [_myTable reloadData];
    }
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
                        [myColorListItems removeAllObjects];
                        [Color dropAllRecords];
                        
                        for (NSDictionary * row in JSON) {                            
                            Color * color = [[Color newRecord] initWithDict:row];
                            [color save];

                            [myColorListItems addObject:color];
                        }
                        [_myTable reloadData];
                        [SVProgressHUD showSuccessWithStatus:@"Done"];
                    }
        
                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                    {
                        [SVProgressHUD showErrorWithStatus:error.description];
                    }];
        [SVProgressHUD showWithMaskType:2];
        [jsonRequest start];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myColorListItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ColorCell";
    ColorCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ColorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    Color * currentColor;
    
    currentColor = myColorListItems[indexPath.row];
    
    cell = [cell initFromColor:currentColor];
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Color * currentColor = myColorListItems[indexPath.row];
    ColorDetailsVC *detailViewController = [[ColorDetailsVC alloc] initWithColor:currentColor];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
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

- (void)filterContentForSearchText:(NSString *)searchText
{
    [self fetchEntries:[NSString stringWithFormat:@"%@&keywords=%@", COLORLISTURL, searchText]];
}

@end
