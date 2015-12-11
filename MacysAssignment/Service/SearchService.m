//
//  SearchService.m
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import "SearchService.h"
#import "MBProgressHUD.h"
#import "LongForm.h"
#import "HUDUtility.h"

@implementation SearchService

static NSString * const BaseURLString = @"http://www.nactem.ac.uk/software/acromine/dictionary.py";

+ (NSURLSessionDataTask *)searchAcronymofString:(NSString *)searchStr WithBlock:(void (^)(NSArray *acronymResults, NSError *error))block {
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [paramDic setObject:searchStr forKey:@"sf"];
    [paramDic setObject:@"" forKey:@"lf"];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [HUDUtility configureSearchHUD:hud];
    
    NSMutableArray *returnArray = [NSMutableArray array];
    
    return [[NetworkAPIClient sharedClient] GET:BaseURLString parameters:paramDic success:^(NSURLSessionDataTask * __unused task, id JSON) {

        if (((NSArray *)JSON).count > 0) {
            NSDictionary *resultDic = (NSDictionary *)JSON[0];
            NSArray *allLFSDic = [resultDic valueForKey:@"lfs"];
            for (NSDictionary *lfs in allLFSDic) {
                [returnArray addObject:[[LongForm alloc] initWithAttributes:[NSDictionary dictionaryWithObject:[lfs valueForKey:@"lf"] forKey:@"name"]]];
            }
        }
        
        [hud hide:YES];
        if (block) {
            NSLog(@"block is valid");
            block ([NSArray arrayWithArray:returnArray], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"error description: %@", error.description);
        [hud hide:YES];

        MBProgressHUD *errorHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        errorHud.detailsLabelText = error.description;
        [HUDUtility configureErrorHUD:errorHud];
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
