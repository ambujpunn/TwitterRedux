//
//  User.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/24/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const UserDidLoginNotification;
extern NSString * const UserDidLogoutNotification;

@interface User : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *screenname;
@property (nonatomic,strong) NSString *profileImageUrl;
@property (nonatomic,strong) NSString *tagline;
@property (strong, nonatomic) NSDictionary *dictionary;

+ (User *)currentUser;
+ (void)logout;
+ (void)setCurrentUser:(User *) user;
- (id)initWithDictionary: (NSDictionary *) dictionary;

@end
