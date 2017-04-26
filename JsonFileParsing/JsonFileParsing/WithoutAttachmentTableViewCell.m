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
    
    _nameTxtView.text=[NSString stringWithFormat:@"%@ added a note:",_notesDataM.name];
    _descripLabel.text=_notesDataM.notes;
    _dateLbl.text=[NSString stringWithFormat:@"%@",_notesDataM.createDate];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
