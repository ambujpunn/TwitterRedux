//
//  ProfileViewController.m
//  TwitterApp
//
//  Created by Ambuj Punn on 9/30/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "SWRevealViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    User *user = [User currentUser];
    
    self.numFollowers.text = [NSString stringWithFormat:@"%@", user.dictionary[@"followers_count"]];
    self.numFollowing.text = [NSString stringWithFormat:@"%@", user.dictionary[@"friends_count"]];
    self.numTweets.text = [NSString stringWithFormat:@"%@", user.dictionary[@"statuses_count"]];
    self.userName.text = user.name;
    self.userHandle.text = [NSString stringWithFormat:@"@%@", user.screenname];
    [self.profileImage setImageWithURL:[[NSURL alloc] initWithString:user.profileImageUrl]];
    
    self.title = @"Me";
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
