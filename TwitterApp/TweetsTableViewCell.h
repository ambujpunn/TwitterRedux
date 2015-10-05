//
//  TweetsTableViewCell.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/27/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UILabel *timeOfPost;
@property (weak, nonatomic) IBOutlet UITextView *userTweet;

@property (strong, nonatomic) Tweet *tweet;

@end
