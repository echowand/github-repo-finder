//
//  SettingsViewController.m
//  GithubDemo
//
//  Created by Guanqun Mao on 9/15/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

#import "SettingsViewController.h"
#import "RepoResultsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
*/
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    RepoResultsViewController *repoResultsViewController = [segue destinationViewController];
    
    NSInteger minStar = 40000;
    [self.delegate onDone:minStar];
    
    //repoResultsViewController.minStar = 2;
}


@end
