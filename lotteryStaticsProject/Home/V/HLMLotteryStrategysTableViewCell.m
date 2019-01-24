//
//  HLMLotteryStrategysTableViewCell.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMLotteryStrategysTableViewCell.h"

@interface HLMLotteryStrategysTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

@property (weak, nonatomic) IBOutlet UILabel *desLbl;

@property (weak, nonatomic) IBOutlet UILabel *lotteryStrLbl;

@end

@implementation HLMLotteryStrategysTableViewCell

#pragma mark - Setter
- (void)setModel:(HLMLotteryStrategysModel *)model{
    
    _model = model;
    
    self.nameLbl.text = model.name;
    self.timeLbl.text = model.time;
    self.desLbl.text = model.des;
    self.lotteryStrLbl.text = model.lotteryStr;
}

@end
