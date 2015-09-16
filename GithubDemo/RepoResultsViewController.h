//
//  RepoResultsViewController.h
//  GithubDemo
//
//  Created by Nicholas Aiwazian on 9/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepoTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "SettingsViewController.h"

@interface RepoResultsViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, SettingsViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *repoTableView;

@end
