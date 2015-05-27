//
//  ViewController.m
//  KRS Online
//
//  Created by Naufal Dzaki Lubis on 12/5/14.
//  Copyright (c) 2014 Zulham. All rights reserved.
//

#import "ViewController.h"
#import "DashboardController.h"
#import "Helper.h"

@interface ViewController ()

@property (weak, nonatomic) UITextField* textField;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nim.delegate = self;
    self.pass.delegate = self;
    [self.nim becomeFirstResponder];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyboard)];
    [self.view addGestureRecognizer:tapped];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.textField = textField;
}

- (void)resignKeyboard {
    [self.textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)login:(id)sender {
    NSString* nim = self.nim.text;
    NSString* password = self.pass.text;
    if (![nim isEqual: @""] && ![password isEqual: @""]) {
        Helper *help = [[Helper alloc] init];
        NSDictionary* logger = [help processLoginWithNIM:nim andPassword:password];
        if ([[logger objectForKey:@"available"] isEqual: @"YES"]) {
            [help getAllNewsAndSaveItWithNIM:nim];
            [help getMahasiswaDetailByNIMAndStoreIt:nim];
            NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:nim forKey:@"nim"];
            
            DashboardController *dashboard = [self.storyboard instantiateViewControllerWithIdentifier:@"reveal"];
            [dashboard setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:dashboard animated:YES completion:nil];
        } else {
            UIAlertView *alert = [self failLogin];
            [alert show];
        }
    }
}

- (UIAlertView *)failLogin {
    return [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Your NIM or Password is Wrong. Please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
}

@end
