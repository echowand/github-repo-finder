//
//  SettingsViewController.h
//  GithubDemo
//
//  Created by Guanqun Mao on 9/15/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>
-(void) onDone:(NSInteger)result;
@end

@interface SettingsViewController : UIViewController
@property (nonatomic) id<SettingsViewControllerDelegate> delegate;
@property (nonatomic) NSArray* values;
@end
