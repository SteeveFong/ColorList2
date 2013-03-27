//
//  ViewController.m
//  ColorList2
//
//  Created by Steeve Fong on 3/27/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "UIColor+hexToColor.h"
#import "ColorDetailsVC.h"
#import "ColorListVC.h"
#import "ColorCell.h"
#import "ColorList.h"
#import "Constants.h"
#import "Color.h"

#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <SBJson/SBJson.h>

@interface ColorListVC ()
    @property (strong, nonatomic) IBOutlet UITableView * myTable;

    @property (strong, nonatomic) AFJSONRequestOperation * jsonRequest;
    @property (strong, nonatomic) SBJsonParser * jsonParser;
    @property (strong, nonatomic) ColorList * colorList;
    
    @property (strong, nonatomic) NSURL * url;
    @property (strong, nonatomic) NSData * jsonData;
    @property (strong, nonatomic) NSURLRequest * req;
    @property (strong, nonatomic) NSArray * myColorList;
@end

@implementation ColorListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self fetchEntries];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchEntries
{
    _url = [NSURL URLWithString:COLORLISTURL];
    _req = [NSURLRequest requestWithURL:_url];
    
    _jsonRequest = [AFJSONRequestOperation
                    JSONRequestOperationWithRequest:_req
                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
                    {
                        _myColorList = (NSArray *) JSON;
                        [_myTable reloadData];
                        [SVProgressHUD showSuccessWithStatus:@"Done"];
                    }
        
                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                    {
                        
                    }];
    if (! _myColorList) {
        [SVProgressHUD showWithMaskType:2];
        [_jsonRequest start];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_myColorList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ColorCell";
    ColorCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ColorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSDictionary * currentColor = _myColorList[indexPath.row];
    
    [cell setCellFromColorList:currentColor];
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * currentColor = _myColorList[indexPath.row];
    ColorDetailsVC *detailViewController = [[ColorDetailsVC alloc] initWithColor:currentColor];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

@end
