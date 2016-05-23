//
//  EntryListTableViewController.m
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedController].entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedController].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toDetailSegue"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Entry *entry = [EntryController sharedController].entries[indexPath.row];
        
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        
        detailViewController.entry = entry;
    }
}

@end
