//
//  FirstViewController.m
//  Average Calculator
//
//  Created by Alex Lee on 12/19/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize currentMark, examWorth, finalResult, finalMark, examResult, logo, youllNeed, onTheExam, infoSmall, infoBig;

- (void)viewDidLoad
{
    [super viewDidLoad];
        
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight < 560) {
        logo.hidden = YES;
        infoBig.hidden = YES;
    } else {
        infoSmall.hidden = YES;
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculate:(id)sender {
    
    NSString *currentMarkString = [currentMark text];
    NSString *examWorthString = [examWorth text];
    NSString *finalMarkString = [finalMark text];
    
    float currentMarkInt = [currentMarkString floatValue];
    float examWorthInt = [examWorthString floatValue];
    float finalMarkInt = [finalMarkString floatValue];
    
    NSString *examResultString = @"";
    
    if (currentMarkInt == 0 || examWorthInt == 0 ||
        finalMarkInt == 0) {
 
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty mark" message:@"Mark fields cannot be empty or 0" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    } else if (currentMarkInt > 100 || examWorthInt > 100 || finalMarkInt > 100) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Over 100" message:@"Mark fields cannot be over 100\%" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    } else {
        float currentWorthInt = 100.00-examWorthInt;
        
        float examResultInt = (finalMarkInt - (currentMarkInt *(currentWorthInt/100.00)))/(examWorthInt/100.00);
        
        
        examResultString = [NSString stringWithFormat:@"%.2f", examResultInt];
        
        NSString *preMessage = @"to get ";
        examResultString = [examResultString stringByAppendingString:@"\%"];
        
        finalMarkString = [finalMarkString stringByAppendingString:@"\% on the final mark"];
        preMessage = [preMessage stringByAppendingString:finalMarkString];
        finalMarkString = preMessage;
        [youllNeed setText:@"You'll need"];
        [onTheExam setText:@"on the exam"];
        
        if (examResultInt >= 100.00) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Over 100\%" message:@"You'll need over 100% on the exam to get that mark" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alert show];
            
            finalMarkString = @"";
            examResultString = @"";
            [youllNeed setText:@""];
            [onTheExam setText:@""];
        } else if (examResultInt <= 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Less than 0\%" message:@"You'll need less than 0% on the exam to get that mark" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            [alert show];
            finalMarkString = @"";
            examResultString = @"";
            [youllNeed setText:@""];
            [onTheExam setText:@""];
        }
    }
    
    
    
    [examResult setText:examResultString];
    [finalResult setText:finalMarkString];
    
    
    [currentMark resignFirstResponder];
    [examWorth resignFirstResponder];
    [finalMark resignFirstResponder];
}

- (void)infoMessage {
    UIAlertView *infoAlert = [[UIAlertView alloc] initWithTitle:@"How-To" message:@"This will calculate how much you need to aim to get on the exam in order to get the desired grade you entered in the fields" delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil];
    
    [infoAlert show];
}

- (IBAction)infoSmall:(id)sender {
    [self infoMessage];
}

- (IBAction)infoBig:(id)sender {
    [self infoMessage];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [examResult setText:@""];
    [finalResult setText:@""];
}


- (IBAction)dismissKeyboard:(id)sender {
    [currentMark resignFirstResponder];
    [examWorth resignFirstResponder];
    [finalMark resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    return (newLength > 5) ? NO : YES;
}
@end
