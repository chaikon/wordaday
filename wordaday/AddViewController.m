//
//  AddViewController.m
//  wordaday
//
//  Created by Alexander Chai on 2/21/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.qf becomeFirstResponder];
    // Do any additional setup after loading the view.
    
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

- (IBAction)addact:(id)sender {
    
    NSString *pth = [[NSBundle mainBundle] pathForResource:@"vocab" ofType:@"plist"];
    NSMutableArray *vocL = [NSMutableArray arrayWithContentsOfFile:pth];
    NSNumber *zer = [NSNumber numberWithInt:0];
    NSMutableDictionary *vocDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.qf.text,@"question",self.af.text,@"answer",zer,@"wrong",zer,@"right", nil];
    [vocL addObject:vocDic];
    
    [vocL writeToFile:pth atomically:YES];
    
//    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
