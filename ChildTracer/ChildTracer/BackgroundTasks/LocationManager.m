//
//  LocationManager.m
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationManager

// retuen string with lattitude and lonitude
- (NSString *)deviceLocation{
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    return theLocation;
}

//sned message to this class in ViewDidLoad where uses
- (void)loadLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
}

@end
