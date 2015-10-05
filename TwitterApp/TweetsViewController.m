//
//  TweetsViewController.m
//  TwitterApp
//
//  Created by Ambuj Punn on 9/25/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetsTableViewCell.h"
#import "SWRevealViewController.h"
#import "NavBarViewController.h"
#import "TweetDetailsViewController.h"

@interface TweetsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *allTweets;
@end

@implementation TweetsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[TwitterClient sharedInstance] homeTimelineWithParams:nil compeletion:^(NSArray *tweets, NSError *error) {
            self.allTweets = tweets;
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetsTableViewCell" bundle:nil] forCellReuseIdentifier:@"tweetsCell"];
    //[self.tableView registerNib:[UINib nibWithNibName:@"TweetsTableViewCell" bundle:nil] forCellReuseIdentifier:@"TweetsTableViewCell"];
    
   // self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 150;
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onLogout)];

    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
}

- (void)onLogout {
    [User logout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetsCell"];
    cell.tweet = self.allTweets[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allTweets count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // show tweetsdetaislviewcontroller
    NSLog(@"cell = %ld", indexPath.row);
     //[self presentViewController:[[TweetDetailsViewController alloc] initWithTweet:self.allTweets[indexPath.row]] animated:YES completion:nil];
     [self presentViewController:[[TweetDetailsViewController alloc] init] animated:YES completion:nil];
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
