//
//  HLMRewardRecordViewController.m
//  lotteryStaticsProject
//
//  Created by 贺刘敏 on 2019/1/25.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMRewardRecordViewController.h"
#import "HLMRewardRecordViewCell.h"
#import "HLMRewardRecordModel.h"

static NSString *identifier = @"cell";

@interface HLMRewardRecordViewController ()

@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation HLMRewardRecordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HLMRewardRecordViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    NSArray *arr = [[HLMDataBase shareDataBase] getAllWinRecords];
    
    HLMRewardRecordModel *rewardModel =[[HLMRewardRecordModel alloc]init];
    
    for (HLMAddWinRecordModel *model in arr) {
        
        rewardModel.totalStragyM1 += model.stragyM1;
        rewardModel.totalStragyM2 += model.stragyM2;
        rewardModel.totalStragyM3 += model.stragyM3;
        rewardModel.totalStragyM4 += model.stragyM4;
        rewardModel.totalStragyM5 += model.stragyM5;
    }
    self.dataArr = @[rewardModel];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HLMRewardRecordViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (20*4 + 10*10);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
