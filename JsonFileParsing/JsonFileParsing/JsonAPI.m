//
//  JsonAPI.m
//  JsonFileParsing
//
//  Created by El Capitan on 26/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "JsonAPI.h"

@implementation JsonAPI

+(NSArray*)getDataFromJsonFile
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:path];
    NSArray *arr =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

    return arr;
}

@end
