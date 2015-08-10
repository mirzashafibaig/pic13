//
//  ViewController0.h
//  Pic13
//
//  Created by Mirza on 8/9/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController0 : UIViewController

@property (strong, nonatomic)NSString *userNamesegue;
@property  (strong, nonatomic)PFUser *userofSelected;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UIView *View1;

@end
