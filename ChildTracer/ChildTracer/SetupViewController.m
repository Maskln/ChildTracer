//
//  SetupViewController.m
//  ChildTracer
//
//  Created by Mask on 2/2/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "SetupViewController.h"
#import "MailSender.h"
#import "AppDelegate.h"
#import "LocationManager.h"
#import "Validators.h"

@interface SetupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *batteryLevelField;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //TODO: Extract helper class with methods for hiding keyboard
    self.mailField.returnKeyType = UIReturnKeyDone;
    [self.mailField setDelegate:self];
    [self textFieldShouldReturn:self.mailField];
    self.phoneNumberField.returnKeyType = UIReturnKeyDone;
    [self.phoneNumberField setDelegate:self];
    [self textFieldShouldReturn:self.phoneNumberField];
    self.batteryLevelField.returnKeyType = UIReturnKeyDone;
    [self.batteryLevelField setDelegate:self];
    [self textFieldShouldReturn:self.batteryLevelField];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TODO: Rename to Trace
- (IBAction)trace:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    if (![Validators validateBatteryLevel: self.batteryLevelField.text]) {
        if (((int)self.batteryLevelField.text < 1) || ((int)self.batteryLevelField.text > 100)) {
            [self alertShow: @"Empty or Incorrect" : @"The Battery Level must be between 1 and 100!"];
            return;
        }
    }else if (![Validators validateEmail:self.mailField.text]) {
         [self alertShow: @"Empty or Incorrect" : @"The Email address is empty ot incorrect!"];
        return;
    } else if (![Validators validatePhoneNumber: self.phoneNumberField.text]) {
        [self alertShow: @"Empty or Incorrect" : @"The phone number must start with 359 and contains 12 digits!"];
        return;
    }
    
    appDelegate.batteryLevel = self.batteryLevelField.text;
    appDelegate.emailAddress = self.mailField.text;
    appDelegate.phoneNumber = self.phoneNumberField.text;
    [self alertShow: @"Congrats" : @"You may now leave the application to run in background mode!"];
  
 }

 //TODO: Extract helper class with methods for hiding keyboard
-(void)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(void)alertShow:(NSString*) title : (NSString*) message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
