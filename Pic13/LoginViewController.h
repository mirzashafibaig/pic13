//
//  LoginViewController.h
//  Pic13
//
//  Created by Mirza on 8/3/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameLogin;
@property (weak, nonatomic) IBOutlet UITextField *passwordLogin;
- (IBAction)login:(id)sender;

@end
