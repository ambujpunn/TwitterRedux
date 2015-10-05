//
//  NavBarViewController.h
//  TwitterApp
//
//  Created by Ambuj Punn on 9/29/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavBarViewControllerDelegate;

@interface NavBarViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) id <NavBarViewControllerDelegate> delegate;
@property (nonatomic,strong) NSArray *menuItems;

@end

@protocol NavBarViewControllerDelegate

-(void)showMenu:(NSInteger)menuId;

@end
