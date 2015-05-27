//
//  DashboardController.h
//  KRS Online
//
//  Created by Naufal Dzaki Lubis on 3/11/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardController : UIViewController
@property (strong, nonatomic) NSDictionary* selectedNews;
@property (weak, nonatomic) IBOutlet UITextView *textScroll;

@end
