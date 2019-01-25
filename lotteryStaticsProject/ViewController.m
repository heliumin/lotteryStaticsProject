//
//  ViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "ViewController.h"
#import "HLMWinStatisticsTableViewController.h"
#import "HLMLotteryStrategysTableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) NSArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self.view addSubview:self.tableView];
    
    self.tableView.whc_LeftSpace(0).whc_TopSpace(0).whc_BottomSpace(0).whc_RightSpace(0);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            HLMWinStatisticsTableViewController * vc = [[HLMWinStatisticsTableViewController alloc]init];
            vc.title = self.dataArr[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            HLMLotteryStrategysTableViewController *vc =[[HLMLotteryStrategysTableViewController alloc]init];
            vc.title = self.dataArr[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - Getter
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)dataArr{
    
    if (!_dataArr) {
        
        _dataArr =[NSArray arrayWithObjects:@"中奖统计", @"奖金记录",@"彩票策略",nil];
    }
    return _dataArr;
}

@end
