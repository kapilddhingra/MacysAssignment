//
//  HUDUtility.m
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/10/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import "HUDUtility.h"

@implementation HUDUtility

+ (void) configureErrorHUD:(MBProgressHUD *)errorHud
{
    errorHud.mode = MBProgressHUDModeText;
    errorHud.removeFromSuperViewOnHide = YES;
    [errorHud hide:YES afterDelay:5];
}

+ (void) configureSearchHUD:(MBProgressHUD *)hud
{
    hud.labelText = @"Searching...";
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
}

@end
