//
//  NotesDataModel.h
//  JsonFileParsing
//
//  Created by El Capitan on 26/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NotesDataModel : NSObject

@property(nonatomic,strong)UIImage *thumbnailImage;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *notes;
@property(nonatomic,strong)NSString *createDate;
@property(nonatomic,strong)NSArray *attachments;
@property(nonatomic,strong)NSString *imageDataString;

@end
