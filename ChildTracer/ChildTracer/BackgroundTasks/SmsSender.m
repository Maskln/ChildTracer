//
//  SmsSender.m
//  ChildTracer
//
//  Created by Mask on 2/7/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "SmsSender.h"


@implementation SmsSender

NSString* const Key = @"4e8ae040";
NSString* const Secret = @"5189d5eb";

- (NSString *) sendSms:(NSString *)number : (NSString *) message {
    
    NSString* url = [NSString stringWithFormat: @"https://rest.nexmo.com/sms/json?api_key=%@&api_secret=%@&from=NEXMO&to=%@&text=%@", Key, Secret, number, message];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
 
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

@end
