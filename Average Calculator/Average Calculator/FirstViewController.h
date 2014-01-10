//
//  FirstViewController.h
//  Average Calculator
//
//  Created by Alex Lee on 12/19/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>

- (IBAction)calculate:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *currentMark;
@property (weak, nonatomic) IBOutlet UITextField *examWorth;
@property (weak, nonatomic) IBOutlet UITextField *finalMark;
@property (weak, nonatomic) IBOutlet UILabel *examResult;
@property (weak, nonatomic) IBOutlet UILabel *finalResult;
@property (weak, nonatomic) IBOutlet UILabel *youllNeed;
@property (weak, nonatomic) IBOutlet UILabel *onTheExam;
- (IBAction)infoSmall:(id)sender;
- (IBAction)infoBig:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *infoSmall;
@property (weak, nonatomic) IBOutlet UIButton *infoBig;

- (void)textFieldDidBeginEditing:(UITextField *)textField;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (IBAction)dismissKeyboard:(id)sender;
- (void)infoMessage;

@end
