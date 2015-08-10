//
//  EditFriendsTableViewController.m
//  Pic13
//
//  Created by Mirza on 8/4/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "EditFriendsTableViewController.h"
#import "EditProfileCellTableViewCell.h"
#import <Parse/Parse.h>
@interface EditFriendsTableViewController ()

@end

@implementation EditFriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *object, NSError *error){
        if (!error) {
            self.allUsers = object;
            [self.tableView reloadData];
        }
    }];
    [self.tableView setContentInset:UIEdgeInsetsMake(23, 0, 0, 0)];
    self.currentUser = [PFUser currentUser];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// Return the number of rows in the section.
    return [self.allUsers count];
}

// initalize table view
-(EditProfileCellTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    EditProfileCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFUser*user = [self.allUsers objectAtIndex:indexPath.row];
    cell.profileImageUser.layer.cornerRadius = 25; // height of an imageView then divide it by 2
    cell.profileImageUser.layer.masksToBounds=YES;
    // getting profile pic from parse users class of every users in a tableview
    
    PFFile *file = [user objectForKey:@"ProfilePicture"];
    if (file!=nil) {
        // users that has profile picture
        NSURL *urL = [[NSURL alloc] initWithString:file.url];
        NSData *data = [NSData dataWithContentsOfURL:urL];
        cell.profileImageUser.image =[UIImage imageWithData:data];
        
        
    }else{
        //users that don't have profile pic so set a default pic from assets blank human !
        
    }
    
    
NSString *first= user[@"FirstName"];
    NSString *lastName = user[@"LastName"];
    
    first = [first stringByAppendingString:@" "];
    NSString *fullName = [first stringByAppendingString:lastName];
    
    
    cell.usernameUser.text = fullName;
    
    if ([self isFriend:user]) {
        self.tableView.allowsMultipleSelection=YES;// multiple selection
        cell.itemSelectImage.layer.cornerRadius = 15; // height of an imageView then divide it by 2
        cell.itemSelectImage.layer.masksToBounds=YES;
        cell.itemSelectImage.backgroundColor = [UIColor greenColor];
    }else{
        cell.itemSelectImage.backgroundColor= [UIColor clearColor];
    }
    
    return cell;
}

// on select

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditProfileCellTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
   
    self.tableView.allowsMultipleSelection=YES;// multiple selection
    cell.itemSelectImage.layer.cornerRadius = 15; // height of an imageView then divide it by 2
    cell.itemSelectImage.layer.masksToBounds=YES;
    cell.itemSelectImage.backgroundColor = [UIColor greenColor];
    
    PFUser*user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *friendsRealtion = [self.currentUser relationForKey:@"to"];
    
    if([self isFriend:user]){
        // remove the checkmark
        cell.itemSelectImage.backgroundColor = [UIColor clearColor];
        // remove the array of friends
        
        for (PFUser *friends in self.friends ) {
            if ([friends.objectId isEqualToString:user.objectId]) {
                [self.friends removeObject:friends];
                break;
            }
        
        }
        [friendsRealtion removeObject:user];
     
        
    }
    else{
        [friendsRealtion addObject:user];
 }
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        
    }];
    
    UIView *bgSelectedColor = [[UIView alloc] init];
    bgSelectedColor.backgroundColor = [UIColor clearColor];
    [cell setSelectedBackgroundView:bgSelectedColor];
    
}

#pragma Hmark - Helper Method
-(BOOL)isFriend:(PFUser *)user{
    for (PFUser *friends in self.friends ) {
        if ([friends.objectId isEqualToString:user.objectId]) {
            return YES;
        }
        
    }
    return NO;
}


@end
