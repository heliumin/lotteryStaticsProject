//
//  MBProgressHUD+HUD.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/28.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "MBProgressHUD+HUD.h"

#define kCurrentWindow ((UIWindow *)[[UIApplication sharedApplication].windows firstObject])b

@implementation MBProgressHUD (HUD)

+ (MBProgressHUD *)showText:(NSString *)text withWindowLast:(BOOL)isLastWindow
{
    UIWindow *window = isLastWindow?[[UIApplication sharedApplication].windows lastObject]:[[UIApplication sharedApplication].windows firstObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = 5;
    hud.detailsLabelText = text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:24];
    hud.detailsLabelColor =[UIColor whiteColor];
    hud.backgroundColor = HLMRGBAColor(0, 0, 0, 0.2);
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
    
    return  hud;
}

@end
