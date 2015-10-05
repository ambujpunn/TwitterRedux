//
//  TweetsTableViewCell.m
//  TwitterApp
//
//  Created by Ambuj Punn on 9/27/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "TweetsTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// override setter of tweet property
- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.userTweet.text = tweet.text;
    [self.profileImage setImageWithURL:[[NSURL alloc] initWithString:tweet.user.profileImageUrl]];
    self.userName.text = tweet.user.name;
    self.userHandle.text = [NSString stringWithFormat:@"@%@", tweet.user.screenname];
    // use date components
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:tweet.createdAt];
    NSInteger hours = [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:tweet.createdAt toDate:[NSDate date] options:0] hour];
    //self.timeOfPost.text = (hours < 24) ? [NSString stringWithFormat:@"%ld h", (long)hours] : [tweet.createdAt description];
    //NSString *fullDate = [NSString stringWithFormat:@"%ld/%ld/%ld", [components month], [components day], [components year]];
    self.timeOfPost.text = hours < 24 ? [NSString stringWithFormat:@"%ld h", hours] : [NSString stringWithFormat:@"%ld/%ld/%ld", [components month], [components day], [components year]];
}

@end
