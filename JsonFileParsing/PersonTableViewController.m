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
#import "ServiceManager.h"
#import "TableViewcellProtocol.h"


@interface PersonTableViewController ()
{
    NSString *emailId;
}

@property(strong,nonatomic) NSArray *arrData;
@property(assign,nonatomic) ServiceStatus service;
@property(nonatomic) id<ShowAlert> alertDelegate;

@end

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    emailId=@"vivekraj011092@gmail.com";
//    _arrData = [[NSArray alloc]initWithArray:[JsonAPI getDataFromJsonFile]];
    _arrData=[JsonAPI getDataFromJsonFile];
    
    [[ServiceManager sharedInstance] callServices:eNotesList withCompletionStatus:^(ServiceStatus sStatus) {
        _service=sStatus;
        [self.alertDelegate configureAlert:_service];
//        if(_service == eNetworkConnected){
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network is Connected" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//            [self presentViewController:alert animated:YES completion:nil];
//            
//        });
//        }else{
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network Error" message:nil preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//                [self presentViewController:alert animated:YES completion:nil];
//                
//            });
//        }
    } withCompletionService:nil];
    
    
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight=100;
    self.tableView.rowHeight=UITableViewAutomaticDimension;
    
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
    ndm.name=[dict objectForKey:@"name"];
    ndm.notes=[dict objectForKey:@"notes"];
    ndm.createDate=[dict objectForKey:@"createDate"];
    ndm.imageDataString=[dict objectForKey:@"thumbnail"];
    ndm.attachments=[NSArray arrayWithArray:[dict objectForKey:@"attachments"]];
    
    if([ndm.attachments count] > 0)
    {
        WithAttachmentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WithAttachmentTableViewCell class])];
        [cell updateUI:ndm];
        cell.nameTextView.userInteractionEnabled=true;
        cell.delegate=self;
        
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
//        });
        
        return cell;

        
    }
    else
    {
        WithoutAttachmentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WithoutAttachmentTableViewCell class])];
        [cell updateUi:ndm];
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
//        });
        return cell;

    }

    
}

-(void)clickHyperlinkText
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Email ID Checked" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
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
