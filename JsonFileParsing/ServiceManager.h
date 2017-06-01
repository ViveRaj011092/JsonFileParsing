//
//  ServiceManager.h
//  JsonFileParsing
//
//  Created by El Capitan on 29/05/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    eNotesList,
    eNotesDetail,
    eNotesImage,
    eNotesIcon
}Service;

typedef enum {
    eServiceFailed,
    eEmptyData,
    eWrongUrl,
    eDownloadSuccess,
    eNetworkError,
    eNetworkConnected
}ServiceStatus;

@interface ServiceManager : NSObject
+ sharedInstance;
-(void)callServices:(Service)serviceEnum withCompletionStatus:(void(^)(ServiceStatus))completionStatus withCompletionService:(void(^)(NSArray*))completionService;
@end
