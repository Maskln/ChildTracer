//
//  Validators.h
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validators : NSObject
+ (BOOL) validateEmail: (NSString *) candidate;
+ (BOOL) validatePhoneNumber: (NSString *) candidate;

@end
