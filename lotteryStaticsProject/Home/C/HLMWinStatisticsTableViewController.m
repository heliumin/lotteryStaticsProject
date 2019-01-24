//
//  HLMWinStatisticsTableViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMWinStatisticsTableViewController.h"
#import "HLMWinStatisticsTableViewCell.h"
#import "HLMAddWinRecordViewController.h"

@interface HLMWinStatisticsTableViewController ()

@property (nonatomic,copy) NSArray *dataArr;

@end

@implementation HLMWinStatisticsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWinRecordAction)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *identifier = @"cell";

    HLMWinStatisticsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell =[[HLMWinStatisticsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    cell.model = self.dataArr[indexPath.row];
    
    return cell;
}

#pragma mark - Event
- (void)addWinRecordAction{
    
    HLMAddWinRecordViewController *vc =[[HLMAddWinRecordViewController alloc]init];
    vc.title = @"添加中奖记录";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Getter
- (NSArray *)dataArr{
    
    if (!_dataArr) {
        
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

@end
