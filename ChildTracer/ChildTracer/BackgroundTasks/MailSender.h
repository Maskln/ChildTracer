//
//  MailSender.h
//  ChildTracer
//
//  Created by Mask on 2/5/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"

@interface MailSender : UIViewController<SKPSMTPMessageDelegate>

- (IBAction)forgotPassword;
@end
