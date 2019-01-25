//
//  HLMDataBase.h
//  lotteryStaticsProject
//
//  Created by test on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLMAddWinRecordModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLMDataBase : NSObject

+(instancetype)shareDataBase;

//添加
- (void)addWinRecord:(HLMAddWinRecordModel *)model;

//删除
- (void)deleteWinRecord:(HLMAddWinRecordModel *)model;

//更新
- (void)updateWinRecord:(HLMAddWinRecordModel *)model;

//查找
- (NSMutableArray *)getAllWinRecords;

@end

NS_ASSUME_NONNULL_END
