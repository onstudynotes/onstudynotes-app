//
//  MainViewController.h
//  Average Calculator
//
//  Created by Alex Lee on 12/23/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *infoSmall;
@property (weak, nonatomic) IBOutlet UIButton *infoBig;
- (IBAction)infoSmall:(id)sender;
- (IBAction)infoBig:(id)sender;
- (IBAction)visitWebsite:(id)sender;
- (IBAction)aboutUs:(id)sender;
- (IBAction)contactUs:(id)sender;

@end
