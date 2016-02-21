//
//  AddViewController.h
//  wordaday
//
//  Created by Alexander Chai on 2/21/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *qf;
@property (weak, nonatomic) IBOutlet UITextField *af;
@property (weak, nonatomic) IBOutlet UIButton *add;
- (IBAction)addact:(id)sender;

@end
