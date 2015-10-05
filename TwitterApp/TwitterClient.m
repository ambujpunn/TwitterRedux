//
//  TwitterClient.m
//  TwitterApp
//
//  Created by Ambuj Punn on 9/23/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet.h"

NSString * const kTwitterConsumerKey = @"n86G29NqPDA5fCNVMBlYTrDqi";
NSString * const kTwitterConsumerSecret = @"EHNvKwReH0RoDmG2rA5Jmxkw2zpVHhwOcqe508utBy2Hb6trbE";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@interface TwitterClient()

@property (nonatomic,strong) void (^loginCompletion)(User *, NSError *);
@end

@implementation TwitterClient

+(TwitterClient*)sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}
-(void)loginWithCompletion:(void (^)(User *, NSError *))completion {
    self.loginCompletion = completion;
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken){
        NSLog(@"got the request token");
        NSURL *authURL = [NSURL URLWithString: [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
    }failure:^(NSError *error) {
        NSLog(@"failed to get the request token");
        self.loginCompletion(nil, error);
    }];
}
- (void)openURL:(NSURL *)url {
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[[BDBOAuth1Credential alloc] initWithQueryString:url.query] success:^(BDBOAuth1Credential *accessToken){
        NSLog(@"Got the access taken");
        [self.requestSerializer saveAccessToken:accessToken];
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject){
            User *user = [[User alloc] initWithDictionary:responseObject];
            [User setCurrentUser:user];
            NSLog(@"current user = %@", user.name);
            NSLog(@"user info = %@", responseObject);
            self.loginCompletion(user,nil);
        }failure:^(AFHTTPRequestOperation *operaation, NSError *error) {
            NSLog(@"failed");
            self.loginCompletion(nil, error);
        }];
       /*
        [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *tweets = [Tweet tweetsWithArray:responseObject];
            for (Tweet *tweet in tweets) {
                NSLog(@"tweet: %@, created at: %@", tweet.text, tweet.createdAt);
            }
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Failed to get tweets");
        }];
        */
    }failure:^(NSError *error) {
        NSLog(@"Failed to get access taken");
        self.loginCompletion(nil, error);
    }];
}

- (void)homeTimelineWithParams:(NSDictionary *)params compeletion:(void (^) (NSArray *tweets, NSError *error))completion {
    [self GET:@"1.1/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        completion(tweets, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)createNewTweet:(NSDictionary *)params completion:(void (^)(Tweet *tweet, NSError *error))completion {
   [self POST:@"1.1/statuses/update.json" parameters:params constructingBodyWithBlock:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       Tweet *tweet = [[Tweet alloc] initWithDictionary:responseObject];
       completion(tweet, nil);
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       completion(nil, error);
   }];
}

@end
