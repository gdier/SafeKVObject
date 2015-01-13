//
//  SKVObject.h
//  SafeKVObject
//
//  Created by Gdier￼ Zhang on 1/14/15.
//  Copyright (c) 2015 gdier.zh(at)gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKVObject : NSObject

+ (instancetype)of:(id)object;
+ (instancetype)ofJSON:(NSString *)jsonString;

- (id)objectAtIndex:(NSUInteger)idx;
- (id)objectForKey:(id)key;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectForKeyedSubscript:(id)key;

// For array & dictionary
- (NSUInteger)count;

@end
