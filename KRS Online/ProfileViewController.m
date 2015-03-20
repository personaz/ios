//
//  ProfileViewController.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = self.revealViewController;
    if (revealController) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
