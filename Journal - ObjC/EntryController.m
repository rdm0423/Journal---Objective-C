//
//  EntryController.m
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "EntryController.h"

static NSString * const EntriesKey = @"entries";

@implementation EntryController

- (void)addEntry:(Entry *)entry {
    
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
    
}
- (void)removeEntry:(Entry *)entry {
    
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage {
    
    NSMutableArray *entries = [NSMutableArray new];
    
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    
    for (NSDictionary *dictionary in entryDictionaries) {
        
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }
    
    self.entries = entries;
}

+ (EntryController *)sharedController {
    
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}


@end
