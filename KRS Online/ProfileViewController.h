//
//  ProfileViewController.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "ViewController.h"

@interface ProfileViewController : ViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImageField;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollField;

@end
