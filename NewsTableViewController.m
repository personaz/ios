//
//  NewsTableViewController.m
//  KRS Online
//
//  Created by Surya on 3/31/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "NewsTableViewController.h"
#import "SWRevealViewController.h"
#import "DashboardController.h"
#import "ModelMapper.h"

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController {
    NSArray* news;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ModelMapper* mapper = [[ModelMapper alloc] init];
    news = [mapper fetchAllNews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    SWRevealViewController *revealController = self.revealViewController;
    if (revealController) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    cell.textLabel.text = [[news objectAtIndex:indexPath.row] valueForKey:@"judul"];
    cell.detailTextLabel.text = [[news objectAtIndex:indexPath.row] valueForKey:@"isi"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DashboardController* dashboard = [self.storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
    NSDictionary* selected = [news objectAtIndex:indexPath.row];
    dashboard.selectedNews = selected;
    [self.navigationController pushViewController:dashboard animated:YES];
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
