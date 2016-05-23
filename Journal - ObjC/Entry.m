//
//  Entry.m
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "Entry.h"

static NSString * const titleKey = @"title";
static NSString * const textKey = @"text";
static NSString * const timestampKey = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp {
    
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        _title = dictionary[titleKey];
        _text = dictionary[textKey];
        _timestamp = dictionary[timestampKey];
    }
    
    return self;
}

- (NSDictionary *)dictionaryCopy {
    
    return @{
             titleKey: self.title,
             textKey: self.text,
             timestampKey: self.timestamp
             };
}

@end
