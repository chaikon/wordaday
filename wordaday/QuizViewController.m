//
//  QuizViewController.m
//  wordaday
//
//  Created by Alexander Chai on 2/20/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import "QuizViewController.h"


@interface QuizViewController ()

@end

@implementation QuizViewController
NSMutableArray *vocLQ;
NSMutableDictionary *vocDicQ;
NSUserDefaults *defl;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.ans becomeFirstResponder];
    defl = [NSUserDefaults standardUserDefaults];
    NSNumber *quizIdx = [defl objectForKey:@"quizidx"];
    int quizint = [quizIdx integerValue];
    
    NSString *pth = [[NSBundle mainBundle] pathForResource:@"vocab" ofType:@"plist"];
    vocLQ = [NSMutableArray arrayWithContentsOfFile:pth];
    vocDicQ = [vocLQ objectAtIndex:quizint];
    
    self.question.text = [vocDicQ objectForKey:@"question"];
    
    
}

-(void)loadNewDate{
    int randIdx = arc4random() % ([vocLQ count]-1);
    NSNumber *num = [NSNumber numberWithInt:randIdx];
    [defl setObject:num forKey:@"quizidx"];
    
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



- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
      [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)submit:(id)sender {
    if ([self.ans.text isEqualToString:[vocDicQ objectForKey:@"answer"]]){
        
        UIAlertView *alertv = [[UIAlertView alloc] initWithTitle:@"Congrats"
                                                         message:@"You are adequate."
                                                        delegate:self
                                               cancelButtonTitle:@"Okay"
                                               otherButtonTitles:nil];
    
        
        [alertv show];
    }
    
    else {
        UIAlertView *alertv = [[UIAlertView alloc] initWithTitle:@"You pathetic cucumber"
                                                         message:@"You answered the question wrong. You are a shame upon all cucumbers"
                                                        delegate:self
                                               cancelButtonTitle:@"I'm Sorry (You'd better be)"
                                               otherButtonTitles:nil];
        [alertv show];
    }
    
}
@end
