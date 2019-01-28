//
//  HLMLotteryStrategysTableViewController.m
//  lotteryStaticsProject
//
//  Created by test on 2019/1/24.
//  Copyright © 2019 HLM. All rights reserved.
//

#import "HLMLotteryStrategysTableViewController.h"
#import "HLMLotteryStrategysModel.h"
#import "HLMLotteryStrategysTableViewCell.h"

static NSString *identifier = @"cell";

@interface HLMLotteryStrategysTableViewController ()

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation HLMLotteryStrategysTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSBundle *bundle =[NSBundle mainBundle];
    NSString *plistStr =[bundle pathForResource:@"LotteryStrategys" ofType:@"plist"];
    NSArray *plistArr =[[NSArray alloc]initWithContentsOfFile:plistStr];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HLMLotteryStrategysTableViewCell" bundle:bundle] forCellReuseIdentifier:identifier];
    
    NSMutableArray *data =[NSMutableArray array];
    [plistArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *dic = (NSDictionary *)obj;
        
        HLMLotteryStrategysModel *mode = [HLMLotteryStrategysModel mj_objectWithKeyValues:dic];
        
        [data addObject:mode];
    }];
    self.dataArr =[NSArray arrayWithArray:data];
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
    
    HLMLotteryStrategysTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:identifier cacheByIndexPath:indexPath configuration:^(id cell) {
        
        HLMLotteryStrategysTableViewCell *stragyCell = (HLMLotteryStrategysTableViewCell *)cell;
        stragyCell.model = self.dataArr[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
