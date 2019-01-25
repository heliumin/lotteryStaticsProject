//
//  HLMDeleteWinRecordViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMDeleteWinRecordViewController.h"

@interface HLMDeleteWinRecordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;

@end

@implementation HLMDeleteWinRecordViewController

- (void)viewDidLoad {
 
    [super viewDidLoad];
}

- (IBAction)deleteBtnAction:(id)sender {
    
    [HLMNotificationCenter postNotificationName:kDeleteModelSuccess object:nil];
}

#pragma mark - Setter
- (void)setModel:(HLMAddWinRecordModel *)model{
    
    _model = model;
}

@end
