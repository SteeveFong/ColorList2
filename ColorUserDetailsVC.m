//
//  ColorUserDetailsVC.m
//  ColorList2
//
//  Created by Steeve Fong on 3/28/13.
//  Copyright (c) 2013 Steeve Fong. All rights reserved.
//

#import "ColorUserDetailsVC.h"
#import "User.h"

@interface ColorUserDetailsVC ()

@property (weak, nonatomic) IBOutlet UIView * vw;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *numColorsLabel;

@end

@implementation ColorUserDetailsVC
{
    NSDictionary * userDetailsDict;
    NSString * myUserName;
}

- (id)initWithUserName:(NSString *)userName
{
    self = [super init];
    
    if (self) {
        myUserName = userName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSArray * userExistArray = [[[User lazyFetcher] whereField:@"userName" equalToValue:myUserName] fetchRecords];
    
    if (userExistArray.count == 0)
        [self fetchEntries:[NSString stringWithFormat:@"http://www.colourlovers.com/api/lover/%@?format=json", myUserName]];
    else {
        User * myUser = [[User alloc] initUserWithArray:userExistArray];
        [self inputValues:myUser];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchEntries:(NSString *)urlStr
{
    NSURL        * url = [NSURL URLWithString:urlStr];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation * jsonRequest = [AFJSONRequestOperation
                                            JSONRequestOperationWithRequest:req
                                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
                                            {                                                
                                                userDetailsDict = (NSDictionary *) JSON[0];
                                                
                                                User * user = [[User newRecord] initUserWithDict:userDetailsDict];
                                                [user save];

                                                [self inputValues:user];
                                                [SVProgressHUD showSuccessWithStatus:@"Done"];
                                            }
                                            
                                            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                            {
                                                [SVProgressHUD showErrorWithStatus:error.description];
                                            }];
    [SVProgressHUD showWithMaskType:2];
    [jsonRequest start];
}

- (void)inputValues:(User *)values
{
    [_userNameLabel setText:[NSString stringWithFormat:@"%@", [values userName]]];
    [_locationLabel  setText:[NSString stringWithFormat:@"%@", [values location]]];
    [_ratingLabel    setText:[NSString stringWithFormat:@"%@", [values rating]]];
    [_numColorsLabel setText:[NSString stringWithFormat:@"%@", [values numColors]]];
    [_vw reloadInputViews];
}

@end
