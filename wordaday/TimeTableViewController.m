//
//  TimeTableViewController.m
//  wordaday
//
//  Created by Alexander Chai on 2/20/16.
//  Copyright © 2016 chaikon. All rights reserved.
//

#import "TimeTableViewController.h"

@interface TimeTableViewController ()

@end

@implementation TimeTableViewController

NSArray *tms;
NSMutableDictionary *seltms;
NSUserDefaults *usrdef;


- (void)viewDidLoad {
    [super viewDidLoad];
    tms = [NSArray arrayWithObjects:@"5-6",@"6-7",@"7-8",@"8-9",@"9-10",nil];
    usrdef=[NSUserDefaults standardUserDefaults];
    seltms = [[NSMutableDictionary alloc] initWithDictionary:[usrdef objectForKey:@"times"]];
    if (seltms==nil){
        seltms = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"somethin else",@"somethin",@"false",@"5-6",@"false",@"6-7",@"false",@"7-8",@"false",@"8-9",@"false",@"9-10", nil];
    }
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tms count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [tms objectAtIndex:indexPath.row];
    NSString *sel = [seltms objectForKey:cell.textLabel.text];
    
    if ([sel  isEqual: @"true"]){
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark){
        cell.accessoryType=UITableViewCellAccessoryNone;
        [seltms setObject:@"false" forKey:cellText];
        
    }
    else {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        [seltms setObject:@"true" forKey:cellText];
    }
    [usrdef setObject:seltms forKey:@"times"];
    [usrdef synchronize];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
