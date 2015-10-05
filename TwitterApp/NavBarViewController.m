//
//  NavBarViewController.m
//  TwitterApp
//
//  Created by Ambuj Punn on 9/29/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "NavBarViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface NavBarViewController ()
@end

@implementation NavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = @[@"Home", @"Profile"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    User *user = [User currentUser];
    self.userName.text = user.name;
    self.userHandle.text = [NSString stringWithFormat:@"@%@", user.screenname];
    [self.userImage setImageWithURL:[[NSURL alloc] initWithString:user.profileImageUrl]];
    
    self.title = @"Navigation";
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.menuItems[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate showMenu:indexPath.row];
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
