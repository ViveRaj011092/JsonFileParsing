//
//  TableViewcellProtocol.h
//  JsonFileParsing
//
//  Created by El Capitan on 21/05/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceManager.h"


@protocol ClickInsideCell <NSObject>

-(void)clickHyperlinkText;

@end

@protocol ShowAlert <NSObject>

-(void)configureAlert:(ServiceStatus)sStatus;

@end
@interface TableViewcellProtocol : NSObject

@end
