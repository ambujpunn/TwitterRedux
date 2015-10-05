//
//  LoginViewController.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/23/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController
@property (weak, nonatomic) id <LoginViewControllerDelegate> delegate;
@end

@protocol LoginViewControllerDelegate
-(void)userLoggedIn;
@end
