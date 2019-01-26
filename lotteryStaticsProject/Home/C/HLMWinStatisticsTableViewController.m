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
    
//    self.tableView.rowHeight = 330;
    [self.tableView registerNib:[UINib nibWithNibName:@"HLMWinStatisticsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    self.tableView.estimatedRowHeight = 400.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
//    添加通知
    [self addNotifications];
    
    //    加载数据
    [self loadData];
}

#pragma mark - Event
- (void)loadData{
    
    self.dataArr =[[HLMDataBase shareDataBase] getAllWinRecords];
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
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

// - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
//{
//
//     if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//
//     } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//
//     }
//}

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
    
//    HLMDeleteWinRecordViewController *vc =[[HLMDeleteWinRecordViewController alloc]init];
//    vc.title = @"删除中奖记录";
//    [self.navigationController pushViewController:vc animated:YES];
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
