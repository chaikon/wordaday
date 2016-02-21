//
//  QuizViewController.h
//  wordaday
//
//  Created by Alexander Chai on 2/20/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ans;
@property (weak, nonatomic) IBOutlet UILabel *question;
- (IBAction)submit:(id)sender;

@end
