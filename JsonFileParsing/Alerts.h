//
//  Alerts.h
//  JsonFileParsing
//
//  Created by El Capitan on 01/06/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceManager.h"
#import "TableViewcellProtocol.h"

@interface Alerts : NSObject<ShowAlert>
-(void)showAlert:(ServiceStatus)sStatus;
@end
