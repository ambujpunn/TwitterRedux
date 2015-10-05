//
//  TwitterClient.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/23/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"
#import "Tweet.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient * ) sharedInstance;

- (void)loginWithCompletion:(void (^) (User* user, NSError *error))completion;
- (void)openURL:(NSURL *) url;

- (void)homeTimelineWithParams:(NSDictionary *)params compeletion:(void (^) (NSArray *tweets, NSError *error))completion;
- (void)createNewTweet:(NSDictionary * )params completion:(void (^) (Tweet *tweet, NSError *erro))completion;
@end
