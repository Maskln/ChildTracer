//
//  BatteryChecker.m
//  ChildTracer
//
//  Created by Mask on 2/5/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "BatteryChecker.h"
#import "StartUpViewController.h"
#import "MailSender.h"
#import "AppDelegate.h"
#import "LocationManager.h"
#import "SmsSender.h"


@implementation BatteryChecker

LocationManager *locationCoordinates;

+(void)checkBatteryPercentage {
    
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    double batLeft = (float) [myDevice batteryLevel] * 100;
    NSLog(@"%.f",batLeft);
    
    //load location
    locationCoordinates = [[LocationManager alloc] init];
    [locationCoordinates loadLocation];
    NSString* latitude = [NSString stringWithFormat:@"%.20lf", locationCoordinates.locationManager.location.coordinate.latitude];
    NSString*  longitude = [NSString stringWithFormat:@"%.20lf", locationCoordinates.locationManager.location.coordinate.longitude];
    
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSString* phoneNumb = appDelegate.phoneNumber;
    NSString* batteryLevel = appDelegate.batteryLevel;
    NSLog(@"%@", phoneNumb);
    
    int minBatteryLevel = [batteryLevel intValue];
    int maxBatteryLevel = [batteryLevel intValue] + 5;
    
    NSString* smsMessage = [NSString stringWithFormat: @"The+Battery+Percents+are:+%@", batteryLevel];
    
    if (batLeft == -100) {
        NSLog(@"No Battery found");
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        
        //send Email;
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,19z?hl=en", latitude, longitude]];
        
        //Sms Sender
        SmsSender* smsSend = [[SmsSender alloc] init];
        [smsSend sendSms: phoneNumb: smsMessage];
    }else if (batLeft >= minBatteryLevel  && batLeft <= maxBatteryLevel){
        
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        
        //Sms Sender
        SmsSender* smsSend = [[SmsSender alloc] init];
        [smsSend sendSms:phoneNumb :smsMessage];
        
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,19z?hl=en", latitude, longitude]];        
    }    
}

@end
