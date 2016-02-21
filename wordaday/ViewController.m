//
//  ViewController.m
//  wordaday
//
//  Created by Alexander Chai on 2/19/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSUserDefaults *usdef;
NSDate *quizDate;
NSDate *quizEnd;

EKEventStore *store;

NSMutableArray *vocL;

bool Cucubmersemaphore;


- (IBAction)takeQuiz:(id)sender {
    NSDate *now = [NSDate date];
    quizDate = [usdef objectForKey:@"quiztime"];
    quizEnd = [NSDate dateWithTimeInterval:180 sinceDate:quizDate];
    
    if ([now isEqual:[now earlierDate:quizDate]]){
        self.MainLabel.text = @"Not Yet, Child";
    }

    else{
        [self performSegueWithIdentifier:@"startQ" sender:nil];
    }
    
}


-(void)loadNewDate{
    int randIdx = arc4random() % ([vocL count]-1);
    NSNumber *num = [NSNumber numberWithInt:randIdx];
    [usdef setObject:num forKey:@"quizidx"];
    
    
    
}

-(void)cucumber{
    if (Cucubmersemaphore){
        UIAlertView *alertv = [[UIAlertView alloc] initWithTitle:@"You pathetic cucumber"
                                                         message:@"You failed to answer the question in time"
                                                        delegate:self
                                               cancelButtonTitle:@"I'm Sorry (You'd better be)"
                                               otherButtonTitles:nil];
        [alertv show];
    }

}

-(void)timerUpdate{
    NSDate *now = [NSDate date];
    NSDate *gdT = [usdef objectForKey:@"quiztime"];
    NSDate *qdTW = [NSDate dateWithTimeInterval:180 sinceDate:gdT];
    
    if ([now isEqual:[now earlierDate:gdT]]){
        self.quizButton.titleLabel.text=@"";
    }
    else if ([quizEnd isEqual:[now earlierDate:qdTW]]){
        [self cucumber];
    }
    else {
        self.quizButton.titleLabel.text=@"Take The Quiz";
    }
    
}

- (void)viewDidLoad {
    store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        if (granted){
            NSLog(@"coo coo");
        }
        else{
            NSLog(@":TTTTTT");
        }
    }];

    usdef = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
//    quizDate = [usdef objectForKey:@"quiztime"];
    quizDate = [NSDate dateWithTimeIntervalSinceNow:1000000000000];
    quizEnd = [NSDate dateWithTimeInterval:180 sinceDate:quizDate];
    
    
    NSNumber *quizIdx = [usdef objectForKey:@"quizidx"];
    int quizint = [quizIdx integerValue];
    
    NSString *pth = [[NSBundle mainBundle] pathForResource:@"vocab" ofType:@"plist"];
    vocL = [NSMutableArray arrayWithContentsOfFile:pth];
    NSMutableDictionary *vocDic = [vocL objectAtIndex:quizint];
    
    NSDate *now = [NSDate date];
    
    if ([usdef objectForKey:@"quizidx"]==nil){
        [self loadNewDate];
    }
    
    if ([quizEnd isEqual:[now earlierDate:quizEnd]]){
        
        
        NSNumber *numWrong = [vocDic objectForKey:@"wrong"];
        int numWInt = [numWrong intValue];
        numWInt++;
        numWrong = [NSNumber numberWithInt:numWInt];
        
        [vocDic setObject:numWrong forKey:@"wrong"];
        
        [vocL replaceObjectAtIndex:quizint withObject:vocDic];
        
        [vocL writeToFile:pth atomically:YES];
        
        NSLog(@"OUTATIME");
        
        [self cucumber];
    }
    

    NSTimer *updater;
    updater = [NSTimer scheduledTimerWithTimeInterval:(1) target:(self) selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)demonstration:(id)sender {
    Cucubmersemaphore=false;
    
    NSDate *delay = [NSDate dateWithTimeIntervalSinceNow:5];
    
    
    [usdef setObject:delay forKey:@"quiztime"];
    
    quizDate = [usdef objectForKey:@"quiztime"];
    quizEnd = [NSDate dateWithTimeInterval:180 sinceDate:quizDate];
    
    [self loadNewDate];
    EKAlarm *alm = [EKAlarm alarmWithAbsoluteDate:delay];
    EKReminder *rem=[EKReminder reminderWithEventStore:store];
    [rem addAlarm:alm];
    [store saveReminder:rem commit:YES error:nil];
    NSLog(@"Stuff");
}


- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
}


@end
