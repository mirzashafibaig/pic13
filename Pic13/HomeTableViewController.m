//
//  HomeTableViewController.m
//  Pic13
//
//  Created by Mirza on 8/3/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "HomeTableViewController.h"
#import <Parse/Parse.h>

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        
    }else{
       [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (IBAction)logout:(id)sender {
    // log the current user
   [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        LoginViewController *loginController = segue.destinationViewController;
        [loginController setHidesBottomBarWhenPushed:YES];
        loginController.navigationItem.hidesBackButton=YES;
    }
}
@end
