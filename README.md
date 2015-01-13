# SafeKVObject
A safe Key-Value object processer

## Require
ARC, iOS 6.0+ or MacOSX 10.8+

## Usage

```objective-c
#import "SKVObject.h"
```

```objective-c
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

NSLog(@"%@", obj[@"k"]);
NSLog(@"array: %@", obj[@"a"][4]);
NSLog(@"dict: %@", obj[@"a"][3][@"dk"]);
NSLog(@"dict2: %@", obj[@"d"][@"dk2"]);
NSLog(@"%@", obj[@"d"][12]);
NSLog(@"f: %@", obj[@"n"]);
NSLog(@"null: %@, NSNull: %@", obj[@"null"], [NSNull null]);
```
