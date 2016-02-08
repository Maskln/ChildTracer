//
//  SmsSender.m
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "SmsSender.h"


@implementation SmsSender

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (NSString *) sendSms:(NSString *)number : (NSString *) message {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString* url = [NSString stringWithFormat: @"https://rest.nexmo.com/sms/json?api_key=4e8ae040&api_secret=5189d5eb&from=NEXMO&to=%@&text=%@", number, message];
    NSLog(@"%@", url);
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %d", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

@end
