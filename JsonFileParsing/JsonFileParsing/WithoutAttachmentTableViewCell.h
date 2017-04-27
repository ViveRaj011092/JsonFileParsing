//
//  WithoutAttachmentTableViewCell.h
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotesDataModel.h"

@interface WithoutAttachmentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UITextView *nameTxtView;
@property (weak, nonatomic) IBOutlet UILabel *descripLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property(strong,nonatomic) NotesDataModel *notesDataM;

-(void)updateUi:(NotesDataModel*)ndm;

@end
