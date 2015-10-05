//
//  Tweet.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/24/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"


@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;

- (id)initWithDictionary: (NSDictionary *) dictionary;
+ (NSArray *)tweetsWithArray: (NSArray *)array;

@end
