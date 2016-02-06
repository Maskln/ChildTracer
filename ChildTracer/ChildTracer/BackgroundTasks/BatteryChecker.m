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

@implementation BatteryChecker

int const MinBatteryLevel = 100;
int const MaxBatteryLevel = 100;


+(void)checkBatteryPercentage {
    
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    UIDevice *myDevice = [UIDevice currentDevice];
    
    [myDevice setBatteryMonitoringEnabled:YES];
    double batLeft = (float) [myDevice batteryLevel] * 100;
    NSLog(@"%.f",batLeft);
    
    if (batLeft == -100) {
        NSLog(@"No Battery found");
    }else if (batLeft >= MinBatteryLevel  && batLeft <= MaxBatteryLevel){
        NSLog(@"I've Got you!");
        MailSender *send = [[MailSender alloc] init];
        [send sendEmailTo: @"lyubomir.nanev@gmail.com" : @"Do you read me?"];
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
