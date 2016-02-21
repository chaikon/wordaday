//
//  ViewController.h
//  wordaday
//
//  Created by Alexander Chai on 2/19/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface ViewController : UIViewController

- (IBAction)demonstration:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *quizButton;
@property (weak, nonatomic) IBOutlet UILabel *MainLabel;
@end

