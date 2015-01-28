//
//  SKVObject.h
//  SafeKVObject
//
//  Created by Gdier￼ Zhang on 1/14/15.
//  Copyright (c) 2015 gdier.zh(at)gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKVValue <NSObject>

@optional
- (int)intValue;
- (unsigned int)unsignedIntValue;
- (long)longValue;
- (unsigned long)unsignedLongValue;
- (long long)longLongValue;
- (unsigned long long)unsignedLongLongValue;
- (float)floatValue;
- (double)doubleValue;
- (BOOL)boolValue;
- (NSInteger)integerValue;
- (NSUInteger)unsignedIntegerValue;
- (NSString *)stringValue;

@end

@interface SKVObject : NSObject <SKVValue, NSFastEnumeration>

+ (instancetype)of:(id)object;
+ (instancetype)ofJSON:(NSString *)jsonString;

- (id)objectAtIndex:(NSUInteger)idx;
- (id)objectForKey:(id)key;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectForKeyedSubscript:(id)key;
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id key, id obj, BOOL *stop))block;
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block;

// For array & dictionary
@property (readonly) NSUInteger count;

@property (readonly, copy) NSArray *arrayValue;
@property (readonly, copy) NSDictionary *dictionaryValue;

@end
