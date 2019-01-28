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
- (BOOL)addWinRecord:(HLMAddWinRecordModel *)model;

//删除
- (BOOL)deleteWinRecord:(HLMAddWinRecordModel *)model;

//更新
- (BOOL)updateWinRecord:(HLMAddWinRecordModel *)model;

//查找全部
- (NSMutableArray *)getAllWinRecords;

//查找某个日期
- (NSMutableArray *)findRecord:(NSString *)time;

@end

NS_ASSUME_NONNULL_END
