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

@interface SetupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mailField;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}
@end
