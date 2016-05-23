//
//  EntryController.h
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic) NSMutableArray *entries;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;

+ (EntryController *)sharedController;

@end
