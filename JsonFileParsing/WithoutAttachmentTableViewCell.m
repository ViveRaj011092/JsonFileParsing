//
//  WithoutAttachmentTableViewCell.m
//  JsonFileParsing
//
//  Created by El Capitan on 25/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "WithoutAttachmentTableViewCell.h"

@implementation WithoutAttachmentTableViewCell
{
    NSString *emailId;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _nameTxtView.scrollEnabled=NO;
    _nameTxtView.textContainerInset=UIEdgeInsetsMake(0, -self.nameTxtView.textContainer.lineFragmentPadding, 0, -self.nameTxtView.textContainer.lineFragmentPadding);
    
    
    
}

-(void)updateUi:(NotesDataModel*)ndm
{
//    _nameTxtView.text=[NSString stringWithFormat:@"%@ added a note:",ndm.name];
    
    ///////////
    emailId = @"vivekraj011092@gmail.com";

    NSString *str = [NSString stringWithFormat:@"%@ added a note:",ndm.name];
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:str];
    NSRange foundRange=[attributedString.mutableString rangeOfString:ndm.name];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSLinkAttributeName value:emailId range:foundRange];
    _nameTxtView.attributedText=attributedString;
    
    ////////////
    _descripLabel.text=ndm.notes;
    
    ////////////
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"d/mm/yy h:m a"];
    double getdate=[ndm.createDate doubleValue];
    NSTimeInterval seconds = getdate/1000;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:seconds];
    _dateLbl.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    ////////////
    NSString *baseString= [NSString stringWithFormat:@"data:image/png;base64,%@",ndm.imageDataString];
    NSURL *url=[NSURL URLWithString:baseString];
    NSData *data=[NSData dataWithContentsOfURL:url];
    _iconImage.image=[UIImage imageWithData:data];
    
}

//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
//{
//    if(URL.absoluteString == emailId)
//    {
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
//        //        [self presentViewController:alert animated:YES completion:nil];
//    }
//    
//    return false;
//    
//}
//
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
