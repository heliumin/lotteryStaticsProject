//
//  MBProgressHUD+HUD.h
//  lotteryStaticsProject
//
//  Created by test on 2019/1/28.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (HUD)

+ (MBProgressHUD *)showText:(NSString *)text withWindowLast:(BOOL)isLastWindow;

@end

NS_ASSUME_NONNULL_END
