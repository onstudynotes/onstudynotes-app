//
//  SecondViewController.h
//  Average Calculator
//
//  Created by Alex Lee on 12/19/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
- (IBAction)smallCalculate:(id)sender;
- (IBAction)bigCalculate:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *smallCalculate;
@property (weak, nonatomic) IBOutlet UIButton *bigCalculate;
@property (weak, nonatomic) IBOutlet UITextField *assignmentMarkLabel;
@property (weak, nonatomic) IBOutlet UITextField *assignmentWeightLabel;
@property (weak, nonatomic) IBOutlet UITextField *midtermMarkLabel;
@property (weak, nonatomic) IBOutlet UITextField *midtermWeightLabel;
@property (weak, nonatomic) IBOutlet UITextField *spareMarkLabel;
@property (weak, nonatomic) IBOutlet UITextField *spareWeightLabel;
@property (weak, nonatomic) IBOutlet UITextField *examMarkLabel;
@property (weak, nonatomic) IBOutlet UITextField *examWeightLabel;
@property (weak, nonatomic) IBOutlet UITextField *finalMarkLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)infoSmall:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *infoSmall;
@property (weak, nonatomic) IBOutlet UIButton *infoBig;
- (IBAction)infoBig:(id)sender;
- (void)calculate;
- (void)resigner;
@end
