//
//  SecondViewController.m
//  Average Calculator
//
//  Created by Alex Lee on 12/19/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize assignmentMarkLabel, assignmentWeightLabel, midtermMarkLabel, midtermWeightLabel, spareMarkLabel, spareWeightLabel, examMarkLabel, examWeightLabel, finalMarkLabel, logo, resultLabel, bigCalculate, smallCalculate, infoSmall, infoBig;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight < 560) {
        logo.hidden = YES;
        bigCalculate.hidden = YES;
        infoBig.hidden = YES;
    } else {
        smallCalculate.hidden = YES;
        infoSmall.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)infoMessage {
    UIAlertView *infoAlert = [[UIAlertView alloc] initWithTitle:@"How-To" message:@"You can use this calculator to find out your final mark, or if you have a final mark in mind, this will help you figure out how much you'll need on your assignment, tests, midterm, or final in order to get it. \n You'll need to leave the mark you want to find out blank, and the app will figure out the rest" delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil];
    
    [infoAlert show];
}

- (IBAction)infoSmall:(id)sender {
    [self infoMessage];
}

- (IBAction)infoBig:(id)sender {
    [self infoMessage];
}


- (void) calculate {
    NSString *assignmentMarkString = [assignmentMarkLabel text];
    NSString *assignmentWeightString = [assignmentWeightLabel text];
    NSString *midtermMarkString = [midtermMarkLabel text];
    NSString *midtermWeightString = [midtermWeightLabel text];
    NSString *spareMarkString = [spareMarkLabel text];
    NSString *spareWeightString = [spareWeightLabel text];
    NSString *examMarkString = [examMarkLabel text];
    NSString *examWeightString = [examWeightLabel text];
    NSString *finalMarkString = [finalMarkLabel text];
    
    float assignmentMark = [assignmentMarkString floatValue];
    float assignmentWeight = [assignmentWeightString floatValue];
    float midtermMark = [midtermMarkString floatValue];
    float midtermWeight = [midtermWeightString floatValue];
    float spareMark = [spareMarkString floatValue];
    float spareWeight = [spareWeightString floatValue];
    float examMark = [examMarkString floatValue];
    float examWeight = [examWeightString floatValue];
    float finalMark = [finalMarkString floatValue];
    
    //if (spareWeightString.length == 0 || spareMarkString.length == 0) {
    //    spareWeight = 0.0;
    //    spareMark = 0.0;
    //    spareMarkString = @"0";
    //    spareWeightString = @"0";
    // }
    
    float resultMark;
    NSString *resultMarkString;
    NSString *message = @"";
    
    // if all fields are filled
    if (assignmentMarkString.length != 0 &&
        assignmentWeightString.length != 0 &&
        midtermMarkString.length != 0 &&
        midtermWeightString.length != 0 &&
        examMarkString.length != 0 &&
        examWeightString.length != 0 &&
        finalMarkString.length != 0 &&
        spareMarkString.length != 0 &&
        spareWeightString.length != 0) {
        
        UIAlertView *allFieldsFilled = [[UIAlertView alloc] initWithTitle:@"All fields filled" message:@"Leave one field empty so we can calculate that mark" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        [allFieldsFilled show];
        [resultLabel setText:@""];
    }
    // if all fields are empty
    else if (assignmentMarkString.length == 0 &&
        assignmentWeightString.length == 0 &&
        midtermMarkString.length == 0 &&
        midtermWeightString.length == 0 &&
        examMarkString.length == 0 &&
        examWeightString.length == 0 &&
        finalMarkString.length == 0) {
        
        UIAlertView *emptyFieldsAlert = [[UIAlertView alloc] initWithTitle:@"Empty Fields" message:@"There are empty required mark or weight fields" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        [emptyFieldsAlert show];
        [resultLabel setText:@""];
    }
    //error for weights not adding up to 100 (if they're all given)
    else if (assignmentWeightString.length != 0 &&
             midtermWeightString.length != 0 &&
             spareWeightString.length != 0 &&
             examWeightString.length != 0 && (assignmentWeight + examWeight + spareWeight + midtermWeight) != 100) {
        
        UIAlertView *weightsNotTotalling = [[UIAlertView alloc] initWithTitle:@"Weights not 100\%" message:@"The sum of weights are not totalling 100\%" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        NSLog(@"came here");
        [weightsNotTotalling show];
        [resultLabel setText:@""];
    }
    //Assignment Mark empty
    else if (assignmentMarkString.length == 0 &&
             //assignmentWeightString.length != 0 &&
             midtermMarkString.length != 0 &&
             midtermWeightString.length != 0 &&
             spareMarkString.length != 0 &&
             spareWeightString.length != 0 &&
             examMarkString.length != 0 &&
             examWeightString.length != 0 &&
             finalMarkString.length != 0) {
        
        // accounts for missing assignment weight
        if (assignmentWeightString.length == 0) {
            assignmentWeight = 100 - midtermWeight - spareWeight - examWeight;
        }
        
        // calculates mark
        resultMark = ((finalMark) - (examMark * (examWeight/100)) - (spareMark * (spareWeight/100)) - (midtermMark * (midtermWeight/100))) / (assignmentWeight/100);
        
        
        // rounds off and float->int the results
        resultMarkString = [NSString stringWithFormat:@"%.2f", resultMark];
        finalMarkString = [NSString stringWithFormat:@"%.2f", finalMark];
        
        
        // form the message string
        if (resultMark <= 100) {
            message = @"You'll need ";
            message = [message stringByAppendingString:resultMarkString];
            message = [message stringByAppendingString:@"\% on assignments to get "];
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        } else {
            message = @"You'll need over 100\% on assignments to get ";
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        }
        
        // output to interface
        [resultLabel setText:message];
        //perhaps cut float to 2 integers then update the textfield value
        
    }
    // Midterm Mark empty
    else if (assignmentMarkString.length != 0 &&
             assignmentWeightString.length != 0 &&
             midtermMarkString.length == 0 &&
             //midtermWeightString.length != 0 &&
             spareMarkString.length != 0 &&
             spareWeightString.length != 0 &&
             examMarkString.length != 0 &&
             examWeightString.length != 0 &&
             finalMarkString.length != 0) {
        
        // accounts for missing assignment weight
        if (midtermWeightString.length == 0) {
            midtermWeight = 100 - assignmentWeight - spareWeight - examWeight;
        }
        
        // calculates mark
        resultMark = ((finalMark) - (examMark * (examWeight/100)) - (spareMark * (spareWeight/100)) - (assignmentMark * (assignmentWeight/100))) / (midtermWeight/100);
        
        // rounds off and float->int the results
        resultMarkString = [NSString stringWithFormat:@"%.2f", resultMark];
        finalMarkString = [NSString stringWithFormat:@"%.2f", finalMark];
        
        // form the message string
        if (resultMark <= 100) {
            message = @"You'll need ";
            message = [message stringByAppendingString:resultMarkString];
            message = [message stringByAppendingString:@"\% on the midterm to get "];
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        } else {
            message = @"You'll need over 100\% on the midterm to get ";
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        }
        
        // output to interface
        [resultLabel setText:message];
        //perhaps cut float to 2 integers then update the textfield value
    }
    // Spare Mark Empty
    else if (spareMarkString.length == 0 &&
             assignmentMarkString.length != 0 &&
             assignmentWeightString.length != 0 &&
             midtermMarkString.length != 0 &&
             midtermWeightString.length != 0 &&
             //spareWeightString.length != 0 &&
             examMarkString.length != 0 &&
             examWeightString.length != 0 &&
             finalMarkString.length != 0) {
        
        // accounts for missing assignment weight
        if (spareWeightString.length == 0) {
            spareWeight = 100 - assignmentWeight - midtermWeight - examWeight;
        }
        
        // calculates mark
        resultMark = ((finalMark) - (examMark * (examWeight/100)) - (midtermMark * (midtermWeight/100)) - (assignmentMark * (assignmentWeight/100))) / (spareWeight/100);
        
        // rounds off and float->int the results
        resultMarkString = [NSString stringWithFormat:@"%.2f", resultMark];
        finalMarkString = [NSString stringWithFormat:@"%.2f", finalMark];
        
        // form the message string
        if (resultMark <= 100) {
            message = @"You'll need ";
            message = [message stringByAppendingString:resultMarkString];
            message = [message stringByAppendingString:@"\% on the tests to get "];
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        } else {
            message = @"You'll need over 100\% on the midterm to get ";
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        }
        
        // output to interface
        [resultLabel setText:message];
        //perhaps cut float to 2 integers then update the textfield value
        
    }//Exam Mark empty
    else if (assignmentMarkString.length != 0 &&
             assignmentWeightString.length != 0 &&
             midtermMarkString.length != 0 &&
             midtermWeightString.length != 0 &&
             spareMarkString.length != 0 &&
             spareWeightString.length != 0 &&
             examMarkString.length == 0 &&
             examWeightString.length != 0 &&
             finalMarkString.length != 0) {
        
        // accounts for missing assignment weight
        if (examWeightString.length == 0) {
            examWeight = 100 - assignmentWeight - spareWeight - midtermWeight;
        }
        
        // calculates mark
        resultMark = ((finalMark) - (midtermMark * (midtermWeight/100)) - (spareMark * (spareWeight/100)) - (assignmentMark * (assignmentWeight/100))) / (examWeight/100);
        
        // rounds off and float->int the results
        resultMarkString = [NSString stringWithFormat:@"%.2f", resultMark];
        finalMarkString = [NSString stringWithFormat:@"%.2f", finalMark];
        
        // form the message string
        if (resultMark <= 100) {
            message = @"You'll need ";
            message = [message stringByAppendingString:resultMarkString];
            message = [message stringByAppendingString:@"\% on the exam to get "];
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        } else {
            message = @"You'll need over 100\% on the exam to get ";
            message = [message stringByAppendingString:finalMarkString];
            message = [message stringByAppendingString:@"\% as the final mark"];
        }
        
        // output to interface
        [resultLabel setText:message];
        //perhaps cut float to 2 integers then update the textfield value
        
    }
    //Final Mark empty
    else if (finalMarkString.length == 0 &&
             assignmentMarkString.length != 0 &&
             assignmentWeightString.length != 0 &&
             midtermMarkString.length != 0 &&
             midtermWeightString.length != 0 &&
             spareMarkString.length != 0 &&
             spareWeightString.length != 0 &&
             examMarkString.length != 0 &&
             examWeightString.length != 0) {
        
        // accounted for weights not adding up to 100 above
        NSLog(@"Came here");
        
        // calculates mark
        resultMark = (examMark * (examWeight/100)) + (spareMark * (spareWeight/100)) + (midtermMark * (midtermWeight/100))  + (assignmentMark * (assignmentWeight/100));
        
        // rounds off and float->int the results
        resultMarkString = [NSString stringWithFormat:@"%.2f", resultMark];
        finalMarkString = resultMarkString;
        
        // form the message string
        message = @"You'll get ";
        message = [message stringByAppendingString:resultMarkString];
        message = [message stringByAppendingString:@"\% on the final mark"];
        
        // output to interface
        [resultLabel setText:message];
        //perhaps cut float to 2 integers then update the textfield value
        
    }
    //error for empty weight fields
    else if (examWeightString.length == 0 ||
             spareWeightString.length == 0 ||
             assignmentWeightString.length == 0 ||
             midtermWeightString.length == 0) {
        
        UIAlertView *weightAlert = [[UIAlertView alloc] initWithTitle:@"Missing Weights" message:@"Some missing weights must be filled out" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [weightAlert show];
        [resultLabel setText:@""];
    }
    //error for multiple empty fields
    else {
        UIAlertView *missingFieldsAlert = [[UIAlertView alloc] initWithTitle:@"Multiple Missing Fields" message:@"You can only leave 1 mark fields empty" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
        [missingFieldsAlert show];
        [resultLabel setText:@""];
    }
}


- (void)resigner {
    [resultLabel setText:@""];
    
    [assignmentMarkLabel resignFirstResponder];
    [assignmentWeightLabel resignFirstResponder];
    [midtermMarkLabel resignFirstResponder];
    [midtermWeightLabel resignFirstResponder];
    [spareMarkLabel resignFirstResponder];
    [spareWeightLabel resignFirstResponder];
    [examMarkLabel resignFirstResponder];
    [examWeightLabel resignFirstResponder];
    [finalMarkLabel resignFirstResponder];
}


- (IBAction)smallCalculate:(id)sender {
    [self resigner];
    [self calculate];
}

- (IBAction)bigCalculate:(id)sender {
    [self resigner];
    [self calculate];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self resigner];
}
@end
