//
//  EntryDetailViewController.m
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithEntry:self.entry];
}

- (void)updateWithEntry:(Entry *)entry {
    
    if (entry) {
        self.entry = entry;
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.text;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.bodyTextView.text;
        self.entry.timestamp = [NSDate date];
    } else {
        
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
        
        [[EntryController sharedController] addEntry:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}


#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return true;
}


@end
