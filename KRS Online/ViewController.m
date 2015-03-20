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
    /**if (![self.nim.text  isEqual: @""] && ![self.pass.text  isEqual: @""]) {
        Helper *help = [[Helper alloc] init];
        NSDictionary* logger = [help processLoginWithNIM:self.nim.text andPassword:self.pass.text];
    }*/
    if ([self.nim.text  isEqual: @"admin"] && [self.pass.text  isEqual: @"admin"]) {
        DashboardController *dashboard = [self.storyboard instantiateViewControllerWithIdentifier:@"reveal"];
        [dashboard setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:dashboard animated:YES completion:nil];
    }
}

@end
