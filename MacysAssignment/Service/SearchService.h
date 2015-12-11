//
//  SearchService.h
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkAPIClient.h"


@interface SearchService : NSObject

+ (NSURLSessionDataTask *)searchAcronymofString:(NSString *)searchStr WithBlock:(void (^)(NSArray *acronymResults, NSError *error))block;

@end
