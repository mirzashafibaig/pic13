//
//  FriendsViewControllerTableViewController.h
//  Pic13
//
//  Created by Mirza on 8/5/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "FriendsCellProfile.h"
#import "ViewController0.h"
@interface FriendsViewControllerTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong)PFRelation *friendsRelation;
@property (nonatomic, strong)NSArray *friends;
@property (nonatomic, strong)PFUser *user;
@property (nonatomic, strong)NSString *getUsername;
@property (strong, nonatomic)ViewController0 *goToController;
@property (nonatomic, strong)NSArray *searchResults;
@property (nonatomic, strong)ViewController0 *profile1Controller;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;




@end
