//
//  ViewController.h
//  KRS Online
//
//  Created by Naufal Dzaki Lubis on 12/5/14.
//  Copyright (c) 2014 Zulham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nim;
@property (strong, nonatomic) IBOutlet UITextField *pass;

@end

