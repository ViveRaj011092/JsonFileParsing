//
//  Alerts.m
//  JsonFileParsing
//
//  Created by El Capitan on 01/06/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "Alerts.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@implementation Alerts

-(void)showAlert:(ServiceStatus)sStatus
{
    switch (sStatus) {
        case eNetworkConnected:

            

            break;
            
        default:
            break;
    }
}

//-(void)configureAlertMessage:(NSString *)message
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//   
//                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network is Connected" message:nil preferredStyle:UIAlertControllerStyleAlert];
//                    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//                    [self presentViewController:alert animated:YES completion:nil];
//        
//    });
//    
//}

-(void)configureAlert:(ServiceStatus)sStatus
{
    
}

@end
