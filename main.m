//
//  main.m
//  SafeKVObject
//
//  Created by Gdier￼ Zhang on 1/14/15.
//  Copyright (c) 2015 gdier.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKVObject.h"

void test() {
    NSString *jsonString = @"{\"k\":\"v\"}";
    
    // create from json string
    SKVObject *jsonObj = [SKVObject ofJSON:jsonString];
    
    // query by key
    NSLog(@"o[\"k\"] = %@", jsonObj[@"k"]);
    // query by index
    NSLog(@"o[3] = %@", jsonObj[3]);
    
    NSDictionary *dict = @{@"k" : @"v",
                           @"a" : @[@"a", @"b"],
                           @"da" : @{@"0" : @"a", @"1" : @"b", @"2" : @"c"},
                           @"d" : @{@"dk": @{@"dkk": @"dvv"}},
                           @"n" : @1.3f,
                           @"null" : [NSNull null],
                           };
    // create from dictionary
    SKVObject *obj = [SKVObject of:dict];
    
    // Enumeration
    [obj enumerateKeysAndObjectsUsingBlock:^(id key, id object , BOOL *stop) {
        NSLog(@"o[%@] = %@", key, object);
    }];
    [obj[@"a"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"o[\"a\"][%lu] = %@", idx, obj);
    }];
    
    // fastEnumeration
    for (SKVObject *o in obj[@"a"]) {
        NSLog(@"o[\"a\"] = %@", o);
    }
    
    for (id key in obj) {
        NSLog(@"o[%@] = %@", key, obj[key]);
    }
    
    // nesting query
    NSLog(@"o[\"d\"][\"dk\"][\"dkk\"] = %@", obj[@"d"][@"dk"][@"dkk"]);
    NSLog(@"o[\"a\"][0] = %@", obj[@"a"][0]);
    // out of bound
    NSLog(@"o[\"a\"][2] = %@", obj[@"a"][2]);
    // array or dictionary? no matter
    NSLog(@"o[\"a\"][\"0\"] = %@", obj[@"a"][@"0"]);
    NSLog(@"o[\"da\"][\"0\"] = %@", obj[@"da"][@"0"]);
    NSLog(@"o[\"da\"][0] = %@", obj[@"da"][0]);
    // number value convert
    NSLog(@"o[\"n\"]: %f", [obj[@"n"] floatValue]);
    // NSNull will become nil
    NSLog(@"null: %@, NSNull: %@", obj[@"null"], [NSNull null]);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        test();
    }
    return 0;
}

