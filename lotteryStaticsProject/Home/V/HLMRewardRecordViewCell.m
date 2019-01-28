//
//  HLMRewardRecordViewCell.m
//  lotteryStaticsProject
//
//  Created by 贺刘敏 on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMRewardRecordViewCell.h"

@interface HLMRewardRecordViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

@property (weak, nonatomic) IBOutlet UILabel *stragyLbl1;
@property (weak, nonatomic) IBOutlet UILabel *stragyLbl2;
@property (weak, nonatomic) IBOutlet UILabel *stragyLbl3;

@property (weak, nonatomic) IBOutlet UILabel *stragyLbl4;

@property (weak, nonatomic) IBOutlet UILabel *stragyLbl5;

@end

@implementation HLMRewardRecordViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setter
- (void)setModel:(HLMRewardRecordModel *)model{
    
    _model = model;
    
    self.timeLbl.text = model.timeStr;
    
    self.stragyLbl1.text =[NSString stringWithFormat:@"策略1总金额： %@",@(model.totalStragyM1)];
    
    self.stragyLbl2.text =[NSString stringWithFormat:@"策略2总金额： %@",@(model.totalStragyM2)];
    
    self.stragyLbl3.text =[NSString stringWithFormat:@"策略3总金额： %@",@(model.totalStragyM3)];
    
    self.stragyLbl4.text =[NSString stringWithFormat:@"策略4总金额： %@",@(model.totalStragyM4)];
    
    self.stragyLbl5.text =[NSString stringWithFormat:@"策略5总金额： %@",@(model.totalStragyM5)];
}

@end
