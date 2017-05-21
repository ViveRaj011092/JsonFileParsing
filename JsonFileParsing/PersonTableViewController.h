//
//  PersonTableViewController.h
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewcellProtocol.h"

@interface PersonTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ClickInsideCell>
@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end
