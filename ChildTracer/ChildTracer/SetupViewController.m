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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


//TODO: Rename to Trace
- (IBAction)sendMail:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    if (![Validators validateEmail:self.mailField.text]) {
         [self alertShow: @"Empty or Incorrect" : @"The Email address is empty ot incorrect!"];
    } else if (![Validators validatePhoneNumber: self.phoneNumberField.text]) {
        [self alertShow: @"Empty or Incorrect" : @"The phone number must start with 359 and contains 12 digits!"];
    }
    
    appDelegate.emailAddress = self.mailField.text;
    appDelegate.phoneNumber = self.phoneNumberField.text;
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
