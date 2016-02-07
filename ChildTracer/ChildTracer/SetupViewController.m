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
//@property LocationManager *locationCoordinates;
@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mailField.returnKeyType = UIReturnKeyDone;
    [self.mailField setDelegate:self];

//    self.locationCoordinates = [[LocationManager alloc] init];    
//    [self.locationCoordinates loadLocation];
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
//    
//    double latitude = self.locationCoordinates.locationManager.location.coordinate.latitude;
//    double longitude = self.locationCoordinates.locationManager.location.coordinate.longitude;
//    
//    NSLog(@"This is: %f and %f", latitude, longitude);
//    NSLog(@"%@", self.locationCoordinates.deviceLocation);
//    
}

-(void)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}


@end
