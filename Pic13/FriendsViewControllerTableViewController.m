//
//  FriendsViewControllerTableViewController.m
//  Pic13
//
//  Created by Mirza on 8/5/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "FriendsViewControllerTableViewController.h"
#import "EditFriendsTableViewController.h"
#import "FriendsCellProfile.h"
#import "ViewController.h"
#import "ViewController0.h"

@interface FriendsViewControllerTableViewController ()
@end

@implementation FriendsViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self.tableView setContentInset:UIEdgeInsetsMake(-44,0,0,0)];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"to"];
    PFQuery *query = [self.friendsRelation query ];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
    
    [self.tableView reloadData];
    
    
    self.navigationItem.titleView = self.searchBar;
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeTop;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.friends count];
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    FriendsCellProfile *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[FriendsCellProfile alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        self.user = [self.friends objectAtIndex:indexPath.row];     //set the label as the foundUsers username
        cell.firstLastName.text = self.user.username;
  
   //  cell.firstLastName.text= self.user.username;
   
 return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showEditFriends"]) {
        EditFriendsTableViewController *viewController = (EditFriendsTableViewController *)segue.destinationViewController;
        viewController.friends = [NSMutableArray arrayWithArray:self.friends];
    }
    if ([segue.identifier isEqualToString:@"showProfile"]) {
        // got to profile
     
         ViewController *gotoProfileController = (ViewController *)segue.destinationViewController;
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(FriendsCellProfile *)sender];
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
          self.user = [self.friends objectAtIndex:indexPath.row];
        ViewController0 *v0 = [ViewController0 alloc];
       self.profile1Controller.userNamesegue= @"WORKS";
       
        
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   FriendsCellProfile *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}





#pragma  mark - Search Bar Delegate Methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    //dismiss keyboard and reload table
    [self.searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    //Enable the cancel button when the user touches the search field
    self.searchBar.showsCancelButton = TRUE;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    //disable the cancel button when the user ends editing
    self.searchBar.showsCancelButton = FALSE;
    }
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //reset the foundUser property
    self.friends = nil;
    
    [self.tableView reloadData];    //Strip the whitespace off the end of the search text
    NSString *searchText1 = [self.searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    //Check to make sure the field isnt empty and Query parse for username in the text field
    if (![searchText isEqualToString:@""]) {
        
        PFQuery *query = [PFUser query];
        [query whereKey:@"username" containsString:searchText1];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                
                //check to make sure the query actually found a user
                if (objects.count > 0) {
                    
                    //set your foundUser property to the user that was found by the query (we use last object since its an array)
                    self.friends = objects;
                    
                    //The query was succesful but returned no results. A user was not found, display error message
                } else {
                    
                    
                    
                }
                
                //reload the tableView after the user searches
                [self.tableView reloadData];
                
            } else {
                
                //error occurred with query
                
            }
            
        }];
    }else{
        self.friendsRelation = [[PFUser currentUser] objectForKey:@"to"];
        PFQuery *query = [self.friendsRelation query ];
        [query orderByAscending:@"username"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
            if (!error) {
                self.friends = objects;
                [self.tableView reloadData];
            }
        }];    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //dismiss keyboard
    [self.searchBar resignFirstResponder];
    self.searchBar.showsScopeBar = YES;
}



@end
