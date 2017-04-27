//
//  WithoutAttachmentTableViewCell.m
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "WithoutAttachmentTableViewCell.h"

@implementation WithoutAttachmentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _nameTxtView.scrollEnabled=NO;
    _nameTxtView.textContainerInset=UIEdgeInsetsMake(0, -self.nameTxtView.textContainer.lineFragmentPadding, 0, -self.nameTxtView.textContainer.lineFragmentPadding);
    
    
    
}

-(void)updateUi:(NotesDataModel*)ndm
{
    _nameTxtView.text=[NSString stringWithFormat:@"%@ added a note:",ndm.name];
    _descripLabel.text=ndm.notes;
    _dateLbl.text=[NSString stringWithFormat:@"%@",ndm.createDate];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
