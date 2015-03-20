//
//  DashboardController.m
//  KRS Online
//
//  Created by Naufal Dzaki Lubis on 3/11/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "DashboardController.h"
#import "SWRevealViewController.h"

@implementation DashboardController

- (void) viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = self.revealViewController;
    if (revealController) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
