//
//  EditProfileCellTableViewCell.h
//  Pic13
//
//  Created by Mirza on 8/5/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditProfileCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImageUser;
@property (weak, nonatomic) IBOutlet UILabel *usernameUser;
@property (weak, nonatomic) IBOutlet UIImageView *itemSelectImage;



@end
