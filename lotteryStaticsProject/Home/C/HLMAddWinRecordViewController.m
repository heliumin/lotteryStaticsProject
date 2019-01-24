//
//  HLMAddWinRecordViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMAddWinRecordViewController.h"
#import "HLMAddWinRecordModel.h"

@interface HLMAddWinRecordViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView9_10;

@property (weak, nonatomic) IBOutlet UITextView *textView10_11;

@property (weak, nonatomic) IBOutlet UITextView *textView11_12;

@property (weak, nonatomic) IBOutlet UITextField *timeTextField;

@end

@implementation HLMAddWinRecordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    @property (nonatomic,copy) NSString *timeStr;
//    @property (nonatomic, strong) NSArray *data9_10;
//    @property (nonatomic, strong) NSArray *data10_11;
//    @property (nonatomic, strong) NSArray *data11_12;
//    @property (nonatomic,copy) NSString *stragyMoney1;
//    @property (nonatomic,copy) NSString *stragyMoney2;
//    @property (nonatomic,copy) NSString *stragyMoney3;
//    @property (nonatomic,copy) NSString *stragyMoney4;
//    @property (nonatomic,copy) NSString *stragyMoney5;
}

- (IBAction)doneAction:(id)sender {

    NSMutableDictionary *dataDic =[NSMutableDictionary dictionary];
    
    NSString *timeStr = self.timeTextField.text;
    [dataDic setValue:timeStr forKey:@"time"];
    
    NSArray *arr9_10 =[self.textView9_10.text componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr9_10 =[NSMutableArray array];
    if (arr9_10.count > 0) {
        
        for (NSString *str in arr9_10) {
            if (str.length > 0) {
                
                [mutArr9_10 addObject:str];
            }
        }
    }
    [dataDic setValue:mutArr9_10 forKey:@"data9_10"];
    
    [self stragyMoney:mutArr9_10 stragy:1];
    
    NSArray *arr10_11 =[self.textView10_11.text componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr10_11 =[NSMutableArray array];
    if (arr10_11.count > 0) {
        
        for (NSString *str in arr10_11) {
            if (str.length > 0) {
                
                [mutArr10_11 addObject:str];
            }
        }
    }
    [dataDic setValue:mutArr10_11 forKey:@"data10_11"];
    
    NSArray *arr11_12 =[self.textView11_12.text componentsSeparatedByString:@"\n"];
    NSMutableArray *mutArr11_12 =[NSMutableArray array];
    if (arr11_12.count > 0) {
        
        for (NSString *str in arr11_12) {
            if (str.length > 0) {
                
                [mutArr11_12 addObject:str];
            }
        }
    }
    [dataDic setValue:mutArr11_12 forKey:@"data11_12"];
}

- (NSString *)stragyMoney:(NSMutableArray *)mutArr stragy:(NSInteger)type{
    
    NSString *stragyMoney = @"";
    for (NSString *str in mutArr) {
        
        NSArray *arr =[str componentsSeparatedByString:@"-"];
        NSString *lastObject = [arr lastObject];
        NSInteger unWinNum= [lastObject integerValue];
        
        
    }
    return stragyMoney;
}

- (NSString *)bonus:(NSInteger)unWinNum type:(NSInteger)type{
    
    NSInteger bonus = 0;
    switch (type) {
        case 1:
        {
            bonus = [self detailBonus:50];
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        default:
            break;
    }
    
    return nil;
}

- (NSInteger)detailBonus:(NSInteger)principal{
    
    return principal * 0.9;
}

@end
