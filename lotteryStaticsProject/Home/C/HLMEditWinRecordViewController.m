//
//  HLMEditWinRecordViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMEditWinRecordViewController.h"

@interface HLMEditWinRecordViewController ()



@property (weak, nonatomic) IBOutlet UITextView *contentTextView1;

@property (weak, nonatomic) IBOutlet UITextView *contentTextView2;

@property (weak, nonatomic) IBOutlet UITextView *contentTextView3;

@end

@implementation HLMEditWinRecordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)updatebtnAction:(id)sender {
    
    NSString *content9_10 = self.contentTextView1.text;
    
    NSArray *arr9_10 =[content9_10 componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr9_10 =[NSMutableArray array];
    if (arr9_10.count > 0) {
        
        for (NSString *str in arr9_10) {
            if (str.length > 0) {
                
                [mutArr9_10 addObject:str];
            }
        }
    }
    
    CGFloat bonus9_10_1 = [self stragyMoney:mutArr9_10 stragy:1];
    CGFloat bonus9_10_2 = [self stragyMoney:mutArr9_10 stragy:2];
    CGFloat bonus9_10_3 = [self stragyMoney:mutArr9_10 stragy:3];
    CGFloat bonus9_10_4 = [self stragyMoney:mutArr9_10 stragy:4];
    CGFloat bonus9_10_5 = [self stragyMoney:mutArr9_10 stragy:5];
    
    NSString *content10_11 = self.contentTextView2.text;
    NSArray *arr10_11 =[content10_11 componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr10_11 =[NSMutableArray array];
    if (arr10_11.count > 0) {
        
        for (NSString *str in arr10_11) {
            if (str.length > 0) {
                
                [mutArr10_11 addObject:str];
            }
        }
    }
    
    CGFloat bonus10_11_1 = [self stragyMoney:mutArr10_11 stragy:1];
    CGFloat bonus10_11_2 = [self stragyMoney:mutArr10_11 stragy:2];
    CGFloat bonus10_11_3 = [self stragyMoney:mutArr10_11 stragy:3];
    CGFloat bonus10_11_4 = [self stragyMoney:mutArr10_11 stragy:4];
    CGFloat bonus10_11_5 = [self stragyMoney:mutArr10_11 stragy:5];
    
    NSString *content11_12 = self.contentTextView3.text;
    NSArray *arr11_12 =[self.contentTextView3.text componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr11_12 =[NSMutableArray array];
    if (arr11_12.count > 0) {
        
        for (NSString *str in arr11_12) {
            if (str.length > 0) {
                
                [mutArr11_12 addObject:str];
            }
        }
    }
    
    CGFloat bonus11_12_1 = [self stragyMoney:mutArr11_12 stragy:1];
    CGFloat bonus11_12_2 = [self stragyMoney:mutArr11_12 stragy:2];
    CGFloat bonus11_12_3 = [self stragyMoney:mutArr11_12 stragy:3];
    CGFloat bonus11_12_4 = [self stragyMoney:mutArr11_12 stragy:4];
    CGFloat bonus11_12_5 = [self stragyMoney:mutArr11_12 stragy:5];
    
    CGFloat bonus1 = bonus9_10_1 + bonus10_11_1 + bonus11_12_1;
    CGFloat bonus2 = bonus9_10_2 + bonus10_11_2 + bonus11_12_2;
    CGFloat bonus3 = bonus9_10_3 + bonus10_11_3 + bonus11_12_3;
    CGFloat bonus4 = bonus9_10_4 + bonus10_11_4 + bonus11_12_4;
    CGFloat bonus5 = bonus9_10_5 + bonus10_11_5 + bonus11_12_5;

    if (content9_10.length > 0) {
     
        _model.content9_10 = content9_10;
    }
    
    if (content10_11.length > 0) {
        
        _model.content10_11 = content10_11;
    }
    
    if (content11_12.length > 0) {
        
        _model.content11_12 = content11_12;
    }

    if (bonus1 != _model.stragyM1) {
    
        _model.stragyM1 = bonus1;
    }
    
    if (bonus2 != _model.stragyM2) {
        
        _model.stragyM2 = bonus2;
    }
    
    if (bonus3 != _model.stragyM3) {
        
        _model.stragyM3 = bonus3;
    }
    
    if (bonus4 != _model.stragyM4) {
        
        _model.stragyM4 = bonus4;
    }
    
    if (bonus5 != _model.stragyM5) {
        
        _model.stragyM5 = bonus5;
    }
    
    [[HLMDataBase shareDataBase] updateWinRecord:_model];
    
    [HLMNotificationCenter postNotificationName:kUpdateModelSuccess object:nil];
}

- (CGFloat )stragyMoney:(NSMutableArray *)mutArr stragy:(NSInteger)type{
    
    CGFloat bonus = 0;
    for (NSString *str in mutArr) {
        
        NSArray *arr =[str componentsSeparatedByString:@"-"];
        NSString *lastObject = [arr lastObject];
        NSInteger unWinNum= [lastObject integerValue];
        
        CGFloat detailBonus = [self bonus:unWinNum type:type];
        bonus += detailBonus;
    }
    return bonus;
}

- (CGFloat )bonus:(NSInteger)unWinNum type:(NSInteger)type{
    
    CGFloat bonus = 0;
    if (unWinNum >= 4) {
        
        switch (type) {
            case 1:
            {
                CGFloat winBonus = (unWinNum > 5) ? 0 : 95;
                CGFloat principal = (unWinNum > 5) ? 100: (unWinNum - 3)*50;
                
                bonus = winBonus - principal;
            }
                break;
            case 2:
            {
                CGFloat winBonus = (unWinNum > 6) ? 0 : 95;
                CGFloat principal = (unWinNum > 6) ? 150 : (unWinNum - 3)*50;
                
                bonus = winBonus - principal;
            }
                break;
            case 3:
            {
                CGFloat winBonus = (unWinNum > 5) ? 0 : 95 * (unWinNum - 3);
                CGFloat principal = (unWinNum > 5) ? 150 : (50 * (pow(2, (unWinNum-3))-1));
                
                bonus = winBonus - principal;
            }
                break;
            case 4:
            {
                CGFloat winBonus = (unWinNum > 6) ? 0 : 95 * (unWinNum - 3);
                CGFloat principal = (unWinNum > 6) ? 350 : (50 * (pow(2, (unWinNum-3))-1));
                
                bonus = winBonus - principal;
            }
                break;
            case 5:
            {
                CGFloat winBonus = (unWinNum > 7) ? 0 : 95 * (unWinNum - 3);
                CGFloat principal = (unWinNum > 7) ? 750 : (50 * (pow(2, (unWinNum-3))-1));
                
                bonus = winBonus - principal;
            }
                break;
            default:
                break;
        }
    }
    return bonus;
}

#pragma mark - Setter
- (void)setModel:(HLMAddWinRecordModel *)model{
    
    _model = model;
}

@end
