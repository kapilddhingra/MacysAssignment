//
//  LongForm.m
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import "LongForm.h"

@implementation LongForm

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = [attributes valueForKeyPath:@"name"];
    return self;
}


@end
