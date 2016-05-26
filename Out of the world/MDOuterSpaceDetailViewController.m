//
//  MDOuterSpaceDetailViewController.m
//  Out of the world
//
//  Created by Martin Denci on 26/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import "MDOuterSpaceDetailViewController.h"

@interface MDOuterSpaceDetailViewController ()

@end

@implementation MDOuterSpaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UiTableDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataCell" forIndexPath:indexPath];
    
    
    switch(indexPath.row) {
    
        case 0:
            cell.textLabel.text = @"Nickname";
            cell.detailTextLabel.text = self.spaceObject.nickName;
            break;
        case 1:
            cell.textLabel.text = @"Year Length";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.yearLength];
            break;

    }
    
    
    return cell;
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

@end
