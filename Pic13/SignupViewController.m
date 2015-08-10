//
//  SignupViewController.m
//  Pic13
//
//  Created by Mirza on 8/3/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
   self.navigationItem.hidesBackButton =NO;
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
}


- (IBAction)signUp:(id)sender {
    // when you click on signUp button
    
    NSString *firstname = [self.firstName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *lastname = [self.lastName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *username = [self.userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([firstname length] == 0 || [lastname length] == 0 || [email length] == 0 || [username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Please enter all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        // no error lets signup !
        
        PFUser *newuser = [PFUser user]; // new users
        newuser.username = username;
        newuser.password =password;
        newuser.email = email;
        newuser[@"FirstName"] = firstname;
        newuser[@"LastName"] = lastname;
        
        [newuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Hooray! Let them use the app now.
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            } else {
                // eroor
                UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Oops" message:[error.userInfo objectForKey:@"error"]
                                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [errorView show];
            }
        }];
    }
    
}
@end
