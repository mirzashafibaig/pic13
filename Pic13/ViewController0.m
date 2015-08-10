//
//  ViewController0.m
//  Pic13
//
//  Created by Mirza on 8/9/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "ViewController0.h"
#import "FriendsViewControllerTableViewController.h"

@interface ViewController0 ()

@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName.text = self.userNamesegue;
    [[self navigationController] setNavigationBarHidden:YES];
    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
