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
    
    SKVObject *jsonObj = [SKVObject ofJSON:jsonString];
    
    NSLog(@"o[\"k\"] = %@", jsonObj[@"k"]);
    NSLog(@"o[3] = %@", jsonObj[3]);
    
    NSDictionary *dict = @{@"k" : @"v",
                           @"a" : @[@"a", @"b"],
                           @"da" : @{@"0" : @"a", @"1" : @"b", @"2" : @"c"},
                           @"d" : @{@"dk": @{@"dkk": @"dvv"}},
                           @"n" : @1.3f,
                           @"null" : [NSNull null],
                           };
    
    SKVObject *obj = [SKVObject of:dict];
    
    NSLog(@"o[\"d\"][\"dk\"][\"dkk\"] = %@", obj[@"d"][@"dk"][@"dkk"]);
    NSLog(@"o[\"a\"][0] = %@", obj[@"a"][0]);
    NSLog(@"o[\"a\"][2] = %@", obj[@"a"][2]);
    NSLog(@"o[\"a\"][\"0\"] = %@", obj[@"a"][@"0"]);
    NSLog(@"o[\"da\"][\"0\"] = %@", obj[@"da"][@"0"]);
    NSLog(@"o[\"da\"][0] = %@", obj[@"da"][0]);
    NSLog(@"o[\"n\"]: %f", [obj[@"n"] floatValue]);
    NSLog(@"null: %@, NSNull: %@", obj[@"null"], [NSNull null]);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        test();
    }
    return 0;
}

