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
    
    NSLog(@"%@", jsonObj[@"k"]);
    NSLog(@"%@", jsonObj[3]);
    
    NSDictionary *dict = @{@"k" : @"v",
                           @"a" : @[@"0", @"1", @"2", @{@"dk": @"dv"}],
                           @"d" : @{@"dk": @"dv"},
                           @"n" : @1.3f,
                           @"null" : [NSNull null],
                           };
    
    SKVObject *obj = [SKVObject of:dict];
    
    NSLog(@"%@", obj[@"d"][12]);
    
    
    NSLog(@"%@", obj[@"k"]);
    NSLog(@"array: %@", obj[@"a"][4]);
    NSLog(@"dict: %@", obj[@"a"][3][@"dk"]);
    NSLog(@"dict2: %@", obj[@"d"][@"dk2"]);
    NSLog(@"f: %@", obj[@"n"]);
    NSLog(@"null: %@, NSNull: %@", obj[@"null"], [NSNull null]);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        test();
    }
    return 0;
}

