//
//  SmsSender.h
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmsSender : UIView
- (NSString *) sendSms:(NSString *)number : (NSString *) message;
@end
