//
//  ServiceManager.m
//  JsonFileParsing
//
//  Created by El Capitan on 29/05/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "ServiceManager.h"
#import "Constants.h"
#import "Reachability.h"


@implementation ServiceManager


+(id)sharedInstance
{
    static ServiceManager* serviceManagerObject=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceManagerObject=[[self alloc]init];
    });
    return serviceManagerObject;
}

-(id)init
{
    if(self=[super init]){
        NSLog(@"Hi there...");
    }
    return self;
}

//-(void)display
//{
//    NSLog(@"Hello Vivek...%@",baseURL);
//    
//}

-(void)callServices:(Service)serviceEnum withCompletionStatus:(void(^)(ServiceStatus))completionStatus withCompletionService:(void(^)(NSArray*))completionService
{

    if([ServiceManager checkNetworkConnectivity])
    {
        if(completionStatus)
        {
            completionStatus(eNetworkConnected);
        }
    }
    else{
        
        if(completionStatus){
        completionStatus(eNetworkError);
            }
        }
}

+(BOOL)checkNetworkConnectivity
{
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        NSLog(@"Please check your network connection");
        return NO;
    }
    
    return YES;
}


//+(id)sharedInstance
//{
//    if(!serviceManagerObject)
//    {
//        serviceManagerObject=[[ServiceManager alloc] init];
//        
//    }
//    return serviceManagerObject;
//}

//-(id)init
//{
//    if(!serviceManagerObject)
//    {
//        serviceManagerObject=[super init];
//    }
//    return serviceManagerObject;
//}



@end
