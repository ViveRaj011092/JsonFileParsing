//
//  WithAttachmentTableViewCell.m
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "WithAttachmentTableViewCell.h"

@implementation WithAttachmentTableViewCell
{
    NSString *emailId;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _nameTextView.scrollEnabled=NO;
    _nameTextView.textContainerInset=UIEdgeInsetsMake(0, -self.nameTextView.textContainer.lineFragmentPadding, 0, -self.nameTextView.textContainer.lineFragmentPadding);
//    [self updateUI];
    
    
}

-(void)updateUI:(NotesDataModel*)ndm
{
//    _nameTextView.text=[NSString stringWithFormat:@"%@ added a note:",ndm.name];
    
    //////////////
    emailId = @"vivekraj011092@gmail.com";

    NSString *str = [NSString stringWithFormat:@"%@ added a note:",ndm.name];
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:str];
    NSRange foundRange=[attributedString.mutableString rangeOfString:ndm.name];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSLinkAttributeName value:emailId range:foundRange];
    _nameTextView.attributedText=attributedString;
    
    /////////////
    _descriptionLabel.text=ndm.notes;
    
    ////////////
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"d/mm/yy h:m a"];
    double getdate=[ndm.createDate doubleValue];
    NSTimeInterval seconds = getdate/1000;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:seconds];
    _dateLabel.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    ////////////
    NSString *baseString= [NSString stringWithFormat:@"data:image/png;base64,%@",ndm.imageDataString];
    NSURL *url=[NSURL URLWithString:baseString];
    NSData *data=[NSData dataWithContentsOfURL:url];
    _iconImageView.image=[UIImage imageWithData:data];
    
    ///////////
    NSArray *attachment = [[NSArray alloc]initWithArray:ndm.attachments];
    for(NSDictionary *item in attachment)
    {
        NSString *baseStr = [NSString stringWithFormat:@"data:image/png;base64,%@",[item objectForKey:@"name"]];
        NSURL *imageUrl=[NSURL URLWithString:baseStr];
        NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageWithData:imageData]];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_attachmentStactView addArrangedSubview:imageView];
        [UIView animateWithDuration:0.25 animations:^{
            [self.attachmentStactView layoutIfNeeded];
        }];
    }
    
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    if(URL.absoluteString == emailId)
    {
        
        [self.delegate clickHyperlinkText];
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Email ID Checked" message:nil preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//        
//        
//        ///////////
//        
//        UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
//
//        if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
//            
//            viewController = viewController.presentedViewController;
//            
//        }
//
//        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:alert.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:viewController.view.frame.size.height*2.0f];
//        
//        [alert.view addConstraint:constraint];
//
//        [viewController presentViewController:alert animated:YES completion:nil];
//        
//        
////        [self presentViewController:alert animated:YES completion:nil];
    }
    
    return false;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
