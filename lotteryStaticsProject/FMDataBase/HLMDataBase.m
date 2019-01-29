//
//  HLMDataBase.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMDataBase.h"

static HLMDataBase *_DBCtl = nil;

@interface HLMDataBase()<NSCopying,NSMutableCopying>

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation HLMDataBase

+(instancetype)shareDataBase{
    
    if (_DBCtl == nil) {
        
        _DBCtl =[[HLMDataBase alloc]init];
        
        [_DBCtl initDataBase];
    }
    return _DBCtl;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (_DBCtl == nil) {
        
        _DBCtl =[super allocWithZone:zone];
    }
    return _DBCtl;
}

- (id)copy{
    
    return self;
}

- (id)mutableCopy{
    
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    return self;
}

- (void)initDataBase{
    
    NSString *documentPath = kPathDocument;
    
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"model.sqlite"];
    
    _db =[FMDatabase databaseWithPath:filePath];
    
    [_db open];
    
    NSString *winRecordSql = @"CREATE TABLE IF NOT EXISTS 'winRecord' ('id' INTEGER PRIMARY KEY AUTOINCREMENT, 'time' VARCHAR(255),'contentNine' TEXT,'contentTen' TEXT,'contentEle' TEXT, 'stragyM1' VARCHAR(255), 'stragyM2' VARCHAR(255),'stragyM3' VARCHAR(255),'stragyM4' VARCHAR(255),'stragyM5' VARCHAR(255))";
    BOOL success = [self.db executeUpdate:winRecordSql];
    if (success) {
        
        HLMLog(@"创建表成功");
    }
    else{
        
        HLMLog(@"创建表失败");
    }
    [_db close];
}

#pragma mark - Event
- (BOOL)addWinRecord:(HLMAddWinRecordModel *)model{
    
    [_db open];
    
//    NSNumber *maxID = @(0);
    
//    FMResultSet *res =[_db executeQuery:@"SELECT * FROM winRecord "];
    
//    while ([res next]) {
//        if ([maxID integerValue] < [[res stringForColumn:@"person_id"] integerValue]) {
//            maxID = @([[res stringForColumn:@"person_id"] integerValue] ) ;
//        }
//
//    }
//    maxID = @([maxID integerValue] + 1);
    
  BOOL success = [_db executeUpdate:@"INSERT INTO winRecord(time,contentNine,contentTen,contentEle,stragyM1,stragyM2,stragyM3,stragyM4,stragyM5)VALUES(?,?,?,?,?,?,?,?,?)",model.timeStr,model.content9_10,model.content10_11,model.content11_12,@(model.stragyM1),@(model.stragyM2),@(model.stragyM3),@(model.stragyM4),@(model.stragyM5)];
    
    if (success) {
        
        HLMLog(@"插入成功");
    }
    else{
        
        HLMLog(@"插入失败");
    }
    [_db close];
    
    return success;
}

- (BOOL)deleteWinRecord:(HLMAddWinRecordModel *)model{
    
    [_db open];
    
    BOOL success = [_db executeUpdate:@"DELETE FROM winRecord WHERE time = ?",model.timeStr];
    
    [_db close];
    
    return success;
}

- (BOOL)updateWinRecord:(HLMAddWinRecordModel *)model{
    
    [_db open];
    
    BOOL result1 = [_db executeUpdate:@"UPDATE 'winRecord' SET contentNine = ?  WHERE time = ? ",model.content9_10,model.timeStr];

    BOOL result2 = [_db executeUpdate:@"UPDATE 'winRecord' SET contentTen = ?  WHERE time = ? ",model.content10_11,model.timeStr];

    BOOL result3 = [_db executeUpdate:@"UPDATE 'winRecord' SET contentEle = ?  WHERE time = ? ",model.content11_12 ,model.timeStr];
    
    BOOL result4 = [_db executeUpdate:@"UPDATE 'winRecord' SET stragyM1 = ?  WHERE time = ? ",@(model.stragyM1) ,model.timeStr];

    BOOL result5 = [_db executeUpdate:@"UPDATE 'winRecord' SET stragyM2 = ?  WHERE time = ? ",@(model.stragyM2) ,model.timeStr];

    BOOL result6 = [_db executeUpdate:@"UPDATE 'winRecord' SET stragyM3 = ?  WHERE time = ? ",@(model.stragyM3) ,model.timeStr];

    BOOL result7 = [_db executeUpdate:@"UPDATE 'winRecord' SET stragyM4 = ?  WHERE time = ? ",@(model.stragyM4) ,model.timeStr];

    BOOL result8 = [_db executeUpdate:@"UPDATE 'winRecord' SET stragyM5 = ?  WHERE time = ? ",@(model.stragyM5) ,model.timeStr];
    
    [_db close];
    
    return (result1 && result2 && result3 && result4 && result5 && result6 && result7 && result8);
}

- (NSMutableArray *)getAllWinRecords{
    
    [_db open];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM winRecord"];
    
    while ([res next]) {
        
        HLMAddWinRecordModel *model = [[HLMAddWinRecordModel alloc] init];
        model.timeStr = [res stringForColumn:@"time"];
        model.content9_10 = [res stringForColumn:@"contentNine"];
        model.content10_11 = [res stringForColumn:@"contentTen"];
        model.content11_12 = [res stringForColumn:@"contentEle"];
        model.stragyM1 = [[res stringForColumn:@"stragyM1"] doubleValue];
        model.stragyM2 = [[res stringForColumn:@"stragyM2"] doubleValue];
        model.stragyM3 = [[res stringForColumn:@"stragyM3"] doubleValue];
        model.stragyM4 = [[res stringForColumn:@"stragyM4"] doubleValue];
        model.stragyM5 = [[res stringForColumn:@"stragyM5"] doubleValue];
        
        [dataArray addObject:model];
    }
    [_db close];
    return dataArray;
}

- (NSMutableArray *)findRecord:(NSString *)time{
    
    [_db open];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM winRecord where time = %@",time]];
    
    while ([res next]) {
        
        HLMAddWinRecordModel *model = [[HLMAddWinRecordModel alloc] init];
        model.timeStr = [res stringForColumn:@"time"];
        model.content9_10 = [res stringForColumn:@"contentNine"];
        model.content10_11 = [res stringForColumn:@"contentTen"];
        model.content11_12 = [res stringForColumn:@"contentEle"];
        model.stragyM1 = [[res stringForColumn:@"stragyM1"] doubleValue];
        model.stragyM2 = [[res stringForColumn:@"stragyM2"] doubleValue];
        model.stragyM3 = [[res stringForColumn:@"stragyM3"] doubleValue];
        model.stragyM4 = [[res stringForColumn:@"stragyM4"] doubleValue];
        model.stragyM5 = [[res stringForColumn:@"stragyM5"] doubleValue];
        
        [dataArray addObject:model];
    }
    
    [_db close];
    return dataArray;
}

@end
