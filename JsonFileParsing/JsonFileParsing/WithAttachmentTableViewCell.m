//
//  WithAttachmentTableViewCell.m
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "WithAttachmentTableViewCell.h"

@implementation WithAttachmentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _nameTextView.scrollEnabled=NO;
    _nameTextView.textContainerInset=UIEdgeInsetsMake(0, -self.nameTextView.textContainer.lineFragmentPadding, 0, -self.nameTextView.textContainer.lineFragmentPadding);
//    [self updateUI];
    
    
}

-(void)updateUI:(NotesDataModel*)ndm
{
    _nameTextView.text=[NSString stringWithFormat:@"%@ added a note:",ndm.name];
    _descriptionLabel.text=ndm.notes;
    _dateLabel.text=[NSString stringWithFormat:@"%@",ndm.createDate];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
