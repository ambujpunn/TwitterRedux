//
//  TweetDetailsViewController.m
//  TwitterApp
//
//  Created by Ambuj Punn on 10/1/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "TweetsTableViewCell.h"
#import "Tweet.h"
#import "TwitterClient.h"

@interface TweetDetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) Tweet *tweetSelected;
@end

@implementation TweetDetailsViewController

-(instancetype)initWithTweet:(Tweet *)tweetPressed {
    self = [super init];
    if (self) {
        self.tweetSelected = tweetPressed;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load");
    self.detailsTableView.delegate = self;
    self.detailsTableView.dataSource = self;
    
    [self.detailsTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
   // [self.detailsTableView registerNib:[UINib nibWithNibName:@"TweetsTableViewCell" bundle:nil] forCellReuseIdentifier:@"tweetsCell"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        UITableViewCell *tweetDetails = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetDetails"];
        return tweetDetails;
    }
    /*else if(indexPath.row == 1) {
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetDetails"];
    } else {
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetControls"];
    }
     */
//        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetDetails"];
    return [[UITableViewCell alloc] init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row selected = %ld", indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index = %ld", indexPath.row);
    if (indexPath.row == 0) {
        return 200.0;
    } else {
        return 44.0;
    }
}

@end
