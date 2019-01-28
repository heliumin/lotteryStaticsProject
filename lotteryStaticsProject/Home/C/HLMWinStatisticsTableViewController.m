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
#import "HLMEditWinRecordViewController.h"
#import "HLMDeleteWinRecordViewController.h"

static NSString *identifier = @"cell";

@interface HLMWinStatisticsTableViewController ()

@property (nonatomic,copy) NSArray *dataArr;

@end

@implementation HLMWinStatisticsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWinRecordAction)]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HLMWinStatisticsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
//    添加通知
    [self addNotifications];
    
    //    加载数据
    [self loadData];
}

#pragma mark - Event
- (void)loadData{
    
    NSArray *dataArr =[[HLMDataBase shareDataBase] getAllWinRecords];
    
    self.dataArr = [dataArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        HLMAddWinRecordModel *model1 = (HLMAddWinRecordModel *)obj1;
        HLMAddWinRecordModel *model2 = (HLMAddWinRecordModel *)obj2;
        
        NSDate *date1 =[NSDate dateWithString:model1.timeStr formatString:@"yyyy-MM-dd"];
        NSDate *date2 =[NSDate dateWithString:model2.timeStr formatString:@"yyyy-MM-dd"];
        
        return [date1 compare:date2];
    }];
    
    [self.tableView reloadData];
}

- (void)addNotifications{
    
    [HLMNotificationCenter addObserver:self selector:@selector(loadData) name:kInsertModelSuccess object:nil];
    [HLMNotificationCenter addObserver:self selector:@selector(loadData) name:kDeleteModelSuccess object:nil];
    [HLMNotificationCenter addObserver:self selector:@selector(loadData) name:kUpdateModelSuccess object:nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    HLMWinStatisticsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction
                                          rowActionWithStyle:UITableViewRowActionStyleDestructive
                                          title:@"删除"
                                          handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                              
                                              [self deleteWinRecordAction:indexPath.row];
                                              
                                          }];
    UITableViewRowAction *editAction = [UITableViewRowAction
                                            rowActionWithStyle:UITableViewRowActionStyleNormal
                                            title:@"编辑"
                                            handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
    
                                                [self updateWinRecordAction:indexPath.row];
                                                
                                            }];
    editAction.backgroundColor = [UIColor grayColor];
    return @[deleteAction, editAction];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:identifier cacheByIndexPath:indexPath configuration:^(id cell) {
        
        HLMWinStatisticsTableViewCell *staticsCell = (HLMWinStatisticsTableViewCell *)cell;
        staticsCell.model = self.dataArr[indexPath.row];
    }];
}

#pragma mark - Event
- (void)addWinRecordAction{
    
    HLMAddWinRecordViewController *vc =[[HLMAddWinRecordViewController alloc]init];
    vc.title = @"添加中奖记录";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)deleteWinRecordAction:(NSInteger)index{
    
    HLMAddWinRecordModel *model = self.dataArr[index];
    
    [[HLMDataBase shareDataBase] deleteWinRecord:model];

    [self loadData];
}

- (void)updateWinRecordAction:(NSInteger)index{
    
    HLMAddWinRecordModel *model = self.dataArr[index];
    
    HLMEditWinRecordViewController *vc =[[HLMEditWinRecordViewController alloc]init];
    vc.title = @"编辑中奖记录";
    vc.model = model;
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
