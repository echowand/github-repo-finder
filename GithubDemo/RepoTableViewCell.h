//
//  RepoTableViewCell.h
//  GithubDemo
//
//  Created by Guanqun Mao on 9/15/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *repoImageView;
@property (weak, nonatomic) IBOutlet UILabel *repoName;
@property (weak, nonatomic) IBOutlet UILabel *repoOwner;
@property (weak, nonatomic) IBOutlet UILabel *repoStars;
@property (weak, nonatomic) IBOutlet UILabel *repoForks;
@property (weak, nonatomic) IBOutlet UITextView *repoText;


@end
