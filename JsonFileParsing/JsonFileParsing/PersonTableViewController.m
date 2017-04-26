//
//  PersonTableViewController.m
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "PersonTableViewController.h"
#import "WithAttachmentTableViewCell.h"
#import "WithoutAttachmentTableViewCell.h"
#import "JsonAPI.h"
#import "NotesDataModel.h"


@interface PersonTableViewController ()

@property(strong,nonatomic) NSArray *arrData;

@end

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrData = [[NSArray alloc]initWithArray:[JsonAPI getDataFromJsonFile]];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WithAttachmentTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WithAttachmentTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WithoutAttachmentTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WithoutAttachmentTableViewCell class])];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arrData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NotesDataModel *ndm=[[NotesDataModel alloc]init];
    NSDictionary *dict=[[NSDictionary alloc]init];
    dict=_arrData[indexPath.row];
    ndm.name=[dict objectForKey:@""];
    ndm.notes=[dict objectForKey:@""];
    ndm.createDate=[dict objectForKey:@""];
    ndm.attachments=[NSArray arrayWithArray:[dict objectForKey:@""]];
    
    if([ndm.attachments count] > 0)
    {
        WithAttachmentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WithAttachmentTableViewCell class])];
        cell.notesDM=ndm;
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
        
        return cell;

        
    }
    else
    {
        WithoutAttachmentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WithoutAttachmentTableViewCell class])];
        cell.notesDataM=ndm;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
        return cell;

    }

    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
