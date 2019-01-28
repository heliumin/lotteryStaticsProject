//
//  HLMRewardRecordModel.h
//  lotteryStaticsProject
//
//  Created by 贺刘敏 on 2019/1/26.
//  Copyright © 2019 HLM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLMRewardRecordModel : NSObject

@property(nonatomic, copy) NSString *timeStr;
@property(nonatomic, assign) CGFloat totalStragyM1;
@property(nonatomic, assign) CGFloat totalStragyM2;
@property(nonatomic, assign) CGFloat totalStragyM3;
@property(nonatomic, assign) CGFloat totalStragyM4;
@property(nonatomic, assign) CGFloat totalStragyM5;

@end

NS_ASSUME_NONNULL_END
