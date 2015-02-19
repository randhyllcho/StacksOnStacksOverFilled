//
//  ProfileViewController.m
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/18/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "ProfileViewController.h"
#import "StackOverflowService.h"
#import "UserProfile.h"

@interface ProfileViewController ()
@property (assign, nonatomic) IBOutlet UILabel *userNameLabel;
@property (assign, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (assign, nonatomic) NSArray *userInfo;
@property (assign, nonatomic) UserProfile* myUser;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [[StackOverflowService SharedService] fetchUserInfo:^(NSArray *results, NSString *error) {
    self.userInfo = results;
    self.myUser = self.userInfo.lastObject;
    self.userNameLabel.text = self.myUser.name;
    
    [[StackOverflowService SharedService] fetchUserImage:self.myUser.avatarURL completionHandler:^(UIImage *image) {
      self.userProfileImage.image = image;
    }];
  }];
}

@end
