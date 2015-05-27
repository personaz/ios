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
    self.title = [self.selectedNews valueForKey:@"judul"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString* tglBerita = [NSString stringWithFormat:@"%@", [formatter stringFromDate:[self.selectedNews valueForKey:@"tanggal_berita"]]];
    NSString* isiBerita = [NSString stringWithFormat:@"(%@) - %@", tglBerita, [self.selectedNews valueForKey:@"isi"]];
    self.textScroll.text = isiBerita;
    [self.textScroll setTextAlignment:NSTextAlignmentJustified];
    [self.textScroll setEditable:NO];
}

@end
