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
    [sendMail setFromEmail:@"pesho.the.great@gmail.com"];
    [sendMail setToEmail: emailAddress];
    [sendMail setRelayHost:@"smtp.gmail.com"];
    [sendMail setRequiresAuth:YES];
    [sendMail setLogin:@"pesho.the.great"];
    [sendMail setPass:@"12345678q123"];
    [sendMail setSubject:@"Test"];
    [sendMail setWantsSecure:YES];
    [sendMail setDelegate:self];
   
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

@end
