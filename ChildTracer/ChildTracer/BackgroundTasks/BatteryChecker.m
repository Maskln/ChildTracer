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


@implementation BatteryChecker

int const MinBatteryLevel = 0;
int const MaxBatteryLevel = 100;
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
    NSString* latitude = [NSString stringWithFormat:@"%.20lf",locationCoordinates.locationManager.location.coordinate.latitude];
    NSString*  longitude = [NSString stringWithFormat:@"%.20lf", locationCoordinates.locationManager.location.coordinate.longitude];
    
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    if (batLeft == -100) {
        NSLog(@"No Battery found");
      
       // https://www.google.bg/maps/@42.67246,23.2684534,15.25z?hl=en
        
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,15.25z?hl=en", latitude, longitude]];
    }else if (batLeft >= MinBatteryLevel  && batLeft <= MaxBatteryLevel){
        NSLog(@"I've Got you!");
//        double latitude = locationCoordinates.locationManager.location.coordinate.latitude;
//        double longitude = locationCoordinates.locationManager.location.coordinate.longitude;
        NSLog(@"Latitude: %@ and longitude: %@", latitude, longitude);
        NSLog(@"%@", locationCoordinates.deviceLocation);
        
        
        MailSender *send = [[MailSender alloc] init];
       
        [send sendEmailTo: appDelegate.emailAddress : [NSString stringWithFormat: @"https://www.google.com/maps/preview/@%@,%@,19z?hl=en", latitude, longitude]];

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
