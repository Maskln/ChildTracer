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

@interface SetupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UITextField *pinCodeField;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //TODO: Extract helper class with methods for hiding keyboard
    self.mailField.returnKeyType = UIReturnKeyDone;
    [self.mailField setDelegate:self];
    [self textFieldShouldReturn:self.mailField];
    self.pinCodeField.returnKeyType = UIReturnKeyDone;
    [self.pinCodeField setDelegate:self];
    [self textFieldShouldReturn:self.pinCodeField];
    
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

- (IBAction)sendMail:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    appDelegate.emailAddress = self.mailField.text;
}

 //TODO: Extract helper class with methods for hiding keyboard
-(void)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
