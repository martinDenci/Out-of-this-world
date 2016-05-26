//
//  MDOuterSpaceTableViewController.m
//  Out of the world
//
//  Created by Martin Denci on 23/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import "MDOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "MDSpaceObject.h"
#import "MDOuterSpaceTableViewController.h"
#import "MDOuterSpaceImageControllerViewController.h"
#import "MDOuterSpaceDetailViewController.h"

@interface MDOuterSpaceTableViewController ()

@end

@implementation MDOuterSpaceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.planets = [[NSMutableArray alloc] init];
    
    
    for(NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        MDSpaceObject *spaceObject = [[MDSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:spaceObject];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([sender isKindOfClass:[UITableViewCell class]]){
        if([segue.destinationViewController isKindOfClass:[MDOuterSpaceImageControllerViewController class]]) {
            
            MDOuterSpaceImageControllerViewController *nextController = segue.destinationViewController;
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            
            MDSpaceObject *selectedSpaceObject = self.planets[path.row];
            nextController.spaceObject = selectedSpaceObject;
        }
    }
    
    if([sender isKindOfClass:[NSIndexPath class]]){
        if([segue.destinationViewController isKindOfClass:[MDOuterSpaceDetailViewController class]]){
            MDOuterSpaceDetailViewController *detailView = segue.destinationViewController;
            NSIndexPath *path = sender;
            MDSpaceObject *selectedObject = self.planets[path.row];
            detailView.spaceObject = selectedObject;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
  return [self.planets count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    MDSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickName;
    cell.imageView.image = planet.spaceImage;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark - UiTableViewDelegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath

{
    [self performSegueWithIdentifier:@"push to detail view" sender:indexPath];

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
