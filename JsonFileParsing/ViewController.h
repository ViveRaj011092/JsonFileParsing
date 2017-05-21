//
//  ViewController.h
//  JsonFileParsing
//
//  Created by El Capitan on 26/04/17.
//  Copyright © 2017 Vivek Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textViewTest;
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightForTextV;

@end
