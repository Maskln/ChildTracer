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
     NSLog(@"%@", phoneNumb);
    
    int minBatteryLevel = 0;
    int maxBatteryLevel = 100;
    
    if (batLeft == -100) {
        NSLog(@"No Battery found");
        
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        
        //send Email;
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,19z?hl=en", latitude, longitude]];
        
        //Sms Sender works!
        //SmsSender* smsSend = [[SmsSender alloc] init];
        //[smsSend sendSms: phoneNumb: @"works!"];
    }else if (batLeft >= minBatteryLevel  && batLeft <= maxBatteryLevel){
        NSLog(@"I've Got you!");
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,19z?hl=en", latitude, longitude]];
        
        //Sms Sender works!
        //SmsSender* smsSend = [[SmsSender alloc] init];
        //[smsSend sendSms: phoneNumb: @"works!"];
    }
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
