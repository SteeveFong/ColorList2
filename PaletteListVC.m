//
//  PaletteListVC.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "PaletteListVC.h"
#import "ColorDetailsVC.h"
#import "PaletteCell.h"
#import "Palette.h"

@interface PaletteListVC ()
    @property (strong, nonatomic) IBOutlet UITableView * myTable;
    @property (strong, nonatomic) IBOutlet UISearchBar * mySearchBar;
@end

@implementation PaletteListVC

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
    
    if ([Palette count] == 0) {
        [self fetchEntries:PALETTELISTURL];
    }
    else {
        [myColorListItems addObjectsFromArray:[Palette allRecords]];
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
                                                [Palette dropAllRecords];
                                                
                                                for (NSDictionary * row in JSON) {
                                                    Palette * palette = [[Palette newRecord] initWithDict:row];
                                                    [palette save];
                                                    
                                                    [myColorListItems addObject:palette];
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
    static NSString * CellIdentifier = @"PaletteCell";
    PaletteCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PaletteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Palette * currentPalette;
    
    currentPalette = myColorListItems[indexPath.row];

    cell = [cell initFromPalette:currentPalette];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Palette * currentPalette = myColorListItems[indexPath.row];
    ColorDetailsVC *detailViewController = [[ColorDetailsVC alloc] initWithPalette:currentPalette];
    
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
    [self fetchEntries:[NSString stringWithFormat:@"%@&keywords=%@", PALETTELISTURL, searchText]];
}

@end
