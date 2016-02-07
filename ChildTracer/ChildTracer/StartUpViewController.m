//
//  StartUpViewController.m
//  ChildTracer
//
//  Created by Mask on 2/1/16.
//  Copyright © 2016 Mask. All rights reserved.
//

#import "StartUpViewController.h"


@interface StartUpViewController ()

@end

@implementation StartUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: Extract helper class with methods for hiding keyboard
    self.inputPinCode.returnKeyType = UIReturnKeyDone;
    [self.inputPinCode setDelegate:self];
    [self textFieldShouldReturn:self.inputPinCode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 //TODO: Extract helper class with methods for hiding keyboard
-(void)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
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
