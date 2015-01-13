//
//  SKVObject.m
//  SafeKVObject
//
//  Created by Gdier￼ Zhang on 1/14/15.
//  Copyright (c) 2015 gdier.zh(at)gmail.com. All rights reserved.
//

#import "SKVObject.h"

@interface SKVObject ()

@property(strong, nonatomic) id value;

@end

@implementation SKVObject

+ (instancetype)of:(id)object {
    if (nil == object || [object isKindOfClass:[NSNull class]])
        return nil;
    
    return [[self alloc] initWithObject:object];
}

+ (instancetype)ofJSON:(NSString *)jsonString {
    if (nil == jsonString)
        return nil;
    
    id obj = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    return [self of:obj];
}

- (id)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.value = object;
    }
    return self;
}

- (id)objectAtIndex:(NSUInteger)idx {
    return [self objectAtIndexedSubscript:idx];
}

- (id)objectForKey:(id)key {
    return [self objectForKeyedSubscript:key];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    if ([self.value isKindOfClass:[NSArray class]]) {
        if ([self.value count] <= idx)
            return nil;
        
        return [SKVObject of:[self.value objectAtIndex:idx]];
    }
    
    return nil;
}

- (id)objectForKeyedSubscript:(id)key {
    if ([self.value isKindOfClass:[NSDictionary class]]) {
        id value = [self.value objectForKey:key];
        if (nil == value)
            return nil;
        
        return [SKVObject of:value];
    }
    
    return nil;
}

- (NSUInteger)count {
    if ([self.value isKindOfClass:[NSArray class]] || [self.value isKindOfClass:[NSDictionary class]]) {
        return [self.value count];
    }
    
    return 0;
}

- (NSString *)description {
    if ([self.value isKindOfClass:[NSString class]]) {
        return self.value;
    }

    if ([self.value isKindOfClass:[NSNumber class]]) {
        return [self.value description];
    }
    
    if (nil == self.value || [self.value isKindOfClass:[NSNull class]]) {
        return @"null";
    }
    
    if ([self.value isKindOfClass:[NSArray class]]) {
        NSString *result = @"[";
        NSUInteger count = [self count];
        for (NSUInteger i = 0; i < count; i ++) {
            result = [result stringByAppendingString:[self[i] description]];
            if (i != count - 1)
                result = [result stringByAppendingString:@","];
        }
        result = [result stringByAppendingString:@"]"];
        
        return result;
    }
    
    if ([self.value isKindOfClass:[NSDictionary class]]) {
        NSString *result = @"{";
        NSArray *keys = [self.value allKeys];
        NSUInteger count = [keys count];
        
        for (NSUInteger i = 0; i < count; i ++) {
            result = [result stringByAppendingFormat:@"%@:%@", keys[i], self[keys[i]]];
            if (i != count - 1)
                result = [result stringByAppendingString:@","];
        }
        result = [result stringByAppendingString:@"}"];
        
        return result;
    }
    
    return [super description];
}

@end
