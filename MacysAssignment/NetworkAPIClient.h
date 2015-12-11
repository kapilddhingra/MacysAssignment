//
//  NetworkAPIClient.h
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface NetworkAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
