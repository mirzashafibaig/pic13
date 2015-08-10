//
//  EditFriendsTableViewController.h
//  Pic13
//
//  Created by Mirza on 8/4/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic,strong)PFUser *currentUser;
@property (nonatomic, strong)NSMutableArray *friends;
-(BOOL)isFriend:(PFUser*)user;
@end
