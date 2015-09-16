//
//  RepoResultsViewController.m
//  GithubDemo
//
//  Created by Nicholas Aiwazian on 9/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "RepoResultsViewController.h"
#import "MBProgressHUD.h"
#import "GithubRepo.h"
#import "GithubRepoSearchSettings.h"
#import "SettingsViewController.h"

@interface RepoResultsViewController ()
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) GithubRepoSearchSettings *searchSettings;
@property (nonatomic, strong) NSArray *repos;
@end

@implementation RepoResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchSettings = [[GithubRepoSearchSettings alloc] init];
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    self.navigationItem.titleView = self.searchBar;
    [self doSearch];
    //self.repoTableView.estimatedRowHeight = 200;
    //self.repoTableView.rowHeight = UITableViewAutomaticDimension;
    [self.repoTableView reloadData];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.yahoo.repocell"];
    GithubRepo *repo =self.repos[indexPath.row];
    NSString *url = repo.ownerAvatarURL;
    //NSLog(@"------------url-----%@", url);
    [cell.repoImageView setImageWithURL:[NSURL URLWithString:url]];
    [cell.repoName setText: repo.name];
    [cell.repoOwner setText: repo.ownerHandle];
    [cell.repoText setText: repo.repoDescription];
    [cell.repoStars setText:[NSString stringWithFormat:@"%zd", repo.stars]];
    [cell.repoForks setText:[NSString stringWithFormat:@"%zd", repo.forks]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repos.count;
}

- (void)doSearch {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [GithubRepo fetchRepos:self.searchSettings successCallback:^(NSArray *repos) {
        self.repos = repos;
        for (GithubRepo *repo in repos) {
            
//            NSLog(@"%@", [NSString stringWithFormat:
//                   @"Name:%@\n\tStars:%ld\n\tForks:%ld,Owner:%@\n\tAvatar:%@\n\tDescription:%@\n\t",
//                          repo.name,
//                          repo.stars,
//                          repo.forks,
//                          repo.ownerHandle,
//                          repo.ownerAvatarURL,
//                          repo.repoDescription
//                   ]);
            
        }
        [self.repoTableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchSettings.searchString = searchBar.text;
    //NSLog(@"---------- %zd", [self.magicNumber integerValue]);
    //self.searchSettings.minStars = [self.magicNumber integerValue];
    [searchBar resignFirstResponder];
    [self doSearch];
}

- (void)onDone:(NSInteger)result
{
    //NSLog(@"result from SettingsViewController %zd", result);
    //NSLog(@"result from SettingsViewController %zd", self.minStar);
    self.searchSettings.minStars = result;
    NSLog(@" result from settings: ---------- %zd", self.searchSettings.minStars);
    [self doNewSearch:result];
    [self.repoTableView reloadData];
}

- (void)doNewSearch: (NSInteger) threshold
{
 
    NSMutableArray *arrayThatYouCanRemoveObjects = [NSMutableArray arrayWithArray:self.repos];
    
    for (GithubRepo *repo in self.repos) {
        if(repo.stars < threshold){
            continue;
        }else{
            [arrayThatYouCanRemoveObjects removeObject: repo];
        }
    }
    self.repos = [NSArray arrayWithArray:arrayThatYouCanRemoveObjects];

}

//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SettingsViewController* settings = [segue destinationViewController];
    settings.values = nil;
    settings.delegate = self;
}

@end
