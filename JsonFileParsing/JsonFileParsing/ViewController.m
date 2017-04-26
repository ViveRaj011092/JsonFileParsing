//
//  ViewController.m
//  JsonFileParsing
//
//  Created by El Capitan on 26/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lbl.text=@"vgv jhgh ghg hgjhg jhg ghg hjg hg hgh hggh gggyhgjh jf gf jgghjg hg hj hhjg bvjhh hh ghghg hg hg hjkhkjhkjh kj hjkhkj h jhjkh  ghjkgj ghg";
    
    

//    _textViewTest.translatesAutoresizingMaskIntoConstraints=NO;
//    [_textViewTest sizeToFit];
    
    _textViewTest.scrollEnabled=NO;
//    self.textViewTest.textContainer.maximumNumberOfLines=4;
    
    _textViewTest.textContainerInset= UIEdgeInsetsMake(0,-self.textViewTest.textContainer.lineFragmentPadding,0,-self.textViewTest.textContainer.lineFragmentPadding);

    _textViewTest.text=@"When you set your UITextView’s text asynchronously you should calculate the height of UITextView and set UITextView’s height constraint to it";

//    CGSize sizeThatFitsTextView = [_textViewTest sizeThatFits:CGSizeMake(_textViewTest.frame.size.width, MAXFLOAT)];
//    _heightForTextV.constant = sizeThatFitsTextView.height;
//    _heightForTextV.constant = [_textViewTest intrinsicContentSize].height;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
