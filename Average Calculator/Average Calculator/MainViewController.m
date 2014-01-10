//
//  MainViewController.m
//  Average Calculator
//
//  Created by Alex Lee on 12/23/2013.
//  Copyright (c) 2013 com.onstudynotes. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize infoBig, infoSmall;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight < 560) {
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

- (void)infoMessage {
    UIAlertView *infoAlert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"The official onstudynotes iOS app allows offers direct links to our website as well as native exam average and course average calculator for your convenience. \n\n Later on, we expect to add notes viewing/browsing capabilities to the app" delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil];
    
    [infoAlert show];
}

- (IBAction)infoSmall:(id)sender {
    [self infoMessage];
}

- (IBAction)infoBig:(id)sender {
    [self infoMessage];
}

- (IBAction)visitWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://onstudynotes.com"]];

}

- (IBAction)aboutUs:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://onstudynotes.com/about-us"]];

}

- (IBAction)contactUs:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://onstudynotes.com/contact-us"]];

}
@end
