//
//  SetupViewController.m
//  ChildTracer
//
//  Created by Mask on 2/2/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)checkBatteryPercentage {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    UIDevice *myDevice = [UIDevice currentDevice];
    
    [myDevice setBatteryMonitoringEnabled:YES];
    double batLeft = (float) [myDevice batteryLevel] * 100;
    NSLog(@"%.f",batLeft);
    
    if (batLeft == -100) {
        NSLog(@"No Battery found");
    }else if (batLeft >= 90 && batLeft <= 95){
        NSLog(@"I've Got you!");
    }
    
    //NSString * levelLabel = [NSString stringWithFormat:@"%.f%%", batLeft];
    
    //self.batteryLevel.text = levelLabel;
}



+(void)startTimedTask {
    [self checkBatteryPercentage];
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
