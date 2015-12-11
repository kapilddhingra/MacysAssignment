//
//  NetworkAPIClient.m
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import "NetworkAPIClient.h"

static NSString * const NactemAPIBaseURLString = @"http://www.nactem.ac.uk/software/acromine/dictionary.py";

@implementation NetworkAPIClient

+ (instancetype)sharedClient {
    static NetworkAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetworkAPIClient alloc] initWithBaseURL:[NSURL URLWithString:NactemAPIBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    
    return _sharedClient;
}

@end
