//
//  MailSender.m
//  ChildTracer
//
//  Created by Mask on 2/5/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "MailSender.h"

@interface MailSender ()

@end

@implementation MailSender

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmailTo: (NSString*) emailAddress : (NSString*) andEmailMessage {
    SKPSMTPMessage *sendMail = [[SKPSMTPMessage alloc] init];
    [sendMail setFromEmail:@"pesho.the.great@gmail.com"];  // Change to your email address
    [sendMail setToEmail: emailAddress]; // Load this, or have user enter this
    [sendMail setRelayHost:@"smtp.gmail.com"];
    [sendMail setRequiresAuth:YES]; // GMail requires this
    [sendMail setLogin:@"pesho.the.great"]; // Same as the "setFromEmail:" email
    [sendMail setPass:@"12345678q123"]; // Password for the Gmail account that you are sending from
    [sendMail setSubject:@"Test"]; // Change this to change the subject of the email
    [sendMail setWantsSecure:YES]; // Gmail Requires this
    [sendMail setDelegate:self]; // Required    
   
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain", kSKPSMTPPartContentTypeKey, andEmailMessage, kSKPSMTPPartMessageKey, @"8bit" , kSKPSMTPPartContentTransferEncodingKey, nil];
    
    [sendMail setParts:[NSArray arrayWithObjects:plainPart, nil]];
    [sendMail send];
   }

- (void)messageSent:(SKPSMTPMessage *)message {
    NSLog(@"Message Sent");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email sent" message:@"Check your email." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    NSLog(@"Message Failed With Error(s): %@", [error description]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error. Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
