//
//  LocationManager.h
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject
@property (nonatomic, retain) CLLocationManager *locationManager;

- (NSString *)deviceLocation;
- (void)loadLocation;
@end
