//
//  HLMWinStatisticsTableViewCell.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMWinStatisticsTableViewCell.h"

@interface HLMWinStatisticsTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

@property (weak, nonatomic) IBOutlet UILabel *content11_12Lbl;

@property (weak, nonatomic) IBOutlet UILabel *content10_11Lbl;

@property (weak, nonatomic) IBOutlet UILabel *content9_10Lbl;

@property (weak, nonatomic) IBOutlet UILabel *M1Lbl1;

@property (weak, nonatomic) IBOutlet UILabel *M2Lbl;

@property (weak, nonatomic) IBOutlet UILabel *M3Lbl;

@property (weak, nonatomic) IBOutlet UILabel *M4Lbl;

@property (weak, nonatomic) IBOutlet UILabel *M5Lbl;

@end


@implementation HLMWinStatisticsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setter
- (void)setModel:(HLMAddWinRecordModel *)model{
    
    _model = model;
    
    self.timeLbl.text =[NSString stringWithFormat:@"时间:%@",model.timeStr];
    
    NSString *content9_10Str = model.content9_10.length > 0 ?model.content9_10:@"无";
    NSString *content10_11Str = model.content10_11.length > 0 ?model.content10_11:@"无";
    NSString *content11_12Str = model.content11_12.length > 0 ?model.content11_12:@"无";
    
    self.content9_10Lbl.text = [NSString stringWithFormat:@"9:00-10:00\n%@",content9_10Str];
//    [self.content9_10Lbl sizeToFit];
    
    self.content10_11Lbl.text = [NSString stringWithFormat:@"10:00-11:00\n%@",content10_11Str];
//    [self.content10_11Lbl sizeToFit];
    
    self.content11_12Lbl.text = [NSString stringWithFormat:@"11:00-12:00\n%@",content11_12Str];
//    [self.content11_12Lbl sizeToFit];
    
    self.M1Lbl1.text = [NSString stringWithFormat:@"策略1: %@元",@(model.stragyM1)];
    self.M2Lbl.text = [NSString stringWithFormat:@"策略2: %@元",@(model.stragyM2)];
    self.M3Lbl.text = [NSString stringWithFormat:@"策略3: %@元",@(model.stragyM3)];
    self.M4Lbl.text = [NSString stringWithFormat:@"策略4: %@元",@(model.stragyM4)];
    self.M5Lbl.text = [NSString stringWithFormat:@"策略5: %@元",@(model.stragyM5)];
}

@end
