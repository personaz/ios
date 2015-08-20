//
//  SideMenuTableViewController.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/15/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "ModelMapper.h"

@interface SideMenuTableViewController ()

@end

@implementation SideMenuTableViewController {
    NSArray* menuItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItem = @[@"title", @"news", @"profile", @"krs", @"study", @"logout"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return menuItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = [menuItem objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController* navigation = (UINavigationController*)segue.destinationViewController;
    navigation.title = [[menuItem objectAtIndex:indexPath.row] capitalizedString];
    if ([segue.identifier isEqualToString:@"logout"]) {
        NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
        /** kalau user log out, hapus semua exisiting data in database except berita */
        ModelMapper* mapper = [[ModelMapper alloc] init];
        [mapper removeMahasiswaWithNIM:[userDefault objectForKey:@"nim"]];
        [mapper removeAllNews];
    }
}
@end
