//
//  Entry.h
//  Journal - ObjC
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *timestamp;

@property (strong, nonatomic) NSDictionary *dictionaryCopy;

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
