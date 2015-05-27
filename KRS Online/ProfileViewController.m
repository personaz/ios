//
//  ProfileViewController.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import "ModelMapper.h"
#import "Helper.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController {
    NSMutableArray* coordinate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = self.revealViewController;
    if (revealController) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    coordinate = [[NSMutableArray alloc] initWithCapacity:2];
    [coordinate addObject:[NSNumber numberWithInteger:0]];
    [coordinate addObject:[NSNumber numberWithInteger:5]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    ModelMapper* map = [[ModelMapper alloc] init];
    
    NSDictionary* ms = [[map fetchRowMahasiswaByNIM:[userDefault objectForKey:@"nim"]] firstObject];
    [self initializeView:ms];
}

- (void)createSystemLabelWithString:(NSString*)text {
    CGFloat x = [[coordinate objectAtIndex:0] floatValue];
    CGFloat y = [[coordinate objectAtIndex:1] floatValue];
    CGRect label = CGRectMake(x, y, self.ScrollField.bounds.size.width, 35);
    UILabel* labelText = [[UILabel alloc] initWithFrame:label];
    [labelText setText:text];
    [labelText setFont:[UIFont boldSystemFontOfSize:20]];
    [labelText setTextAlignment:NSTextAlignmentCenter];
    [self.ScrollField addSubview:labelText];
    [coordinate replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:(y + 35)]];
}

- (void)createTitleLabeWithString:(NSString*)title withYPosition:(CGFloat)y {
    CGFloat x = (float) 0;
    CGRect label = CGRectMake(x, y, self.ScrollField.bounds.size.width, 20);
    UILabel* textLabel = [[UILabel alloc] initWithFrame:label];
    [textLabel setText:title];
    [textLabel setFont:[UIFont systemFontOfSize:18]];
    [textLabel setTextAlignment:NSTextAlignmentLeft];
    [self.ScrollField addSubview:textLabel];
}

- (void)createValueLabelWithString:(NSString*)text withPositionY:(CGFloat)y {
    CGFloat x = (float) 0;
    CGRect frames = CGRectMake(x, y, self.ScrollField.bounds.size.width, 20);
    UILabel* labels = [[UILabel alloc] initWithFrame:frames];
    [labels setText:text];
    [labels setFont:[UIFont systemFontOfSize:18]];
    [labels setTextAlignment:NSTextAlignmentLeft];
    [self.ScrollField addSubview:labels];
}

- (void)createTextFieldForTag:(NSInteger)Tag withPositionY:(CGFloat)y {
    CGFloat x = (float) 0;
    CGRect frames = CGRectMake(x, y, (self.ScrollField.bounds.size.width - 5), 30);
    UITextField* field = [[UITextField alloc] initWithFrame:frames];
    [field setBorderStyle:UITextBorderStyleRoundedRect];
    [field setSecureTextEntry:YES];
    [field setTag:Tag];
    [self.ScrollField addSubview:field];
}

- (void)createButtonForTitle:(NSString*)title withPositionY:(CGFloat)y {
    CGFloat width = (float) 150;
    CGRect frames = CGRectMake((self.ScrollField.bounds.size.width / 2) - (width / 2), (y + 30), width, 35);
    UIButton* send = [UIButton buttonWithType:UIButtonTypeSystem];
    [send setFrame:frames];
    [send setTitle:title forState:UIControlStateNormal];
    [send addTarget:self action:@selector(changePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.ScrollField addSubview:send];
}

- (void)changePassword:(UIButton*)button {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* nim = [defaults valueForKey:@"nim"];
    
    UITextField* oldPassword = (UITextField*)[self.ScrollField viewWithTag:1];
    UITextField* newPassword = (UITextField*)[self.ScrollField viewWithTag:2];
    
    Helper* helper = [[Helper alloc] init];
    BOOL response = [helper changePasswordFromOld:oldPassword.text toNew:newPassword.text withNIM:nim];
    NSString* notify;
    if (response == NO) {
        notify = @"Change Password Failed";
    } else {
        notify = @"Change password Success";
        oldPassword.text = @"";
        newPassword.text = @"";
    }
    UIAlertView* view = [self showNotificationWithText:notify];
    [view show];
}

- (void)initializeView:(NSDictionary*)detail {
    [self createSystemLabelWithString:@"Mahasiswa"];
    CGFloat y = [[coordinate objectAtIndex:1] floatValue];
    [self createTitleLabeWithString:@"NIM :" withYPosition:y];
    y = y + 20;
    [self createValueLabelWithString:[detail valueForKey:@"nim"] withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"Full Name :" withYPosition:y];
    y = y + 20;
    [self createValueLabelWithString:[detail valueForKey:@"nama"] withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"Address :" withYPosition:y];
    y = y + 20;
    [self createValueLabelWithString:[detail valueForKey:@"alamat"] withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"Date of Birth :" withYPosition:y];
    y = y + 20;
    [self createValueLabelWithString:[detail valueForKey:@"tgl_lahir"] withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"Gender :" withYPosition:y];
    y = y + 20;
    NSString* gender;
    if ([[detail valueForKey:@"kelamin"] intValue] == 1) {
        gender = @"Laki - laki";
    } else {
        gender = @"Perempuan";
    }
    [self createValueLabelWithString:gender withPositionY:y];
    [coordinate replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:(y + 30)]];
    
    [self createSystemLabelWithString:@"Program Study"];
    y = [[coordinate objectAtIndex:1] floatValue];
    [self createTitleLabeWithString:@"Jurusan :" withYPosition:y];
    y = y + 20;
    [self createValueLabelWithString:[detail valueForKey:@"nama_jurusan"] withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"Program :" withYPosition:y];
    y = y + 20;
    NSString* semester;
    if ([[detail valueForKey:@"program_pendidikan"] intValue] == 1) {
        semester = @"Ganjil";
    } else {
        semester = @"Genap";
    }
    [self createValueLabelWithString:semester withPositionY:y];
    
    [coordinate replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:(y + 30)]];
    [self createSystemLabelWithString:@"Change Password"];
    y = [[coordinate objectAtIndex:1] floatValue];
    [self createTitleLabeWithString:@"Old Password :" withYPosition:y];
    y = y + 20;
    [self createTextFieldForTag:1 withPositionY:y];
    y = y + 35;
    [self createTitleLabeWithString:@"New Password :" withYPosition:y];
    y = y + 20;
    [self createTextFieldForTag:2 withPositionY:y];
    y = y + 20;
    [self createButtonForTitle:@"Send" withPositionY:y];
    
    [coordinate replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:(y + 150)]];
    [self rebuildView];
}

- (void)rebuildView {
    CGFloat height = [[coordinate objectAtIndex:1] floatValue];
    CGSize size = CGSizeMake(self.ScrollField.bounds.size.width, height);
    [self.ScrollField setContentSize:size];
}

- (UIAlertView*)showNotificationWithText:(NSString*)text {
    return [[UIAlertView alloc] initWithTitle:@"Change Password" message:text delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
}

@end
