//
//  TweetDetailsViewController.h
//  TwitterApp
//
//  Created by Ambuj Punn on 10/1/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UITextView *tweet;
//@property (weak, nonatomic) IBOutlet UILabel *timeStamp;


-(instancetype)initWithTweet:(Tweet *)tweetPressed;

@end
