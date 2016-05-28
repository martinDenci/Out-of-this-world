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

#pragma mark - Lazy Instantion of Properties

-(NSMutableArray *)planets
{
    if(!_planets){
        _planets = [[NSMutableArray alloc] init];
    }
    
    return _planets;
}

-(NSMutableArray *)addedSpaceObject
{
    if(!_addedSpaceObject){
        _addedSpaceObject = [[NSMutableArray alloc ]init];
    }
    
    return _addedSpaceObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
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
            
            MDSpaceObject *selectedSpaceObject;
            
            if(path.section == 0) {
                selectedSpaceObject = self.planets[path.row];
            } else if (path.section == 1){
                selectedSpaceObject = self.addedSpaceObject[path.row];
            }
            nextController.spaceObject = selectedSpaceObject;
        }
    }
    
    if([sender isKindOfClass:[NSIndexPath class]]){
        if([segue.destinationViewController isKindOfClass:[MDOuterSpaceDetailViewController class]]){
            MDOuterSpaceDetailViewController *detailView = segue.destinationViewController;
            NSIndexPath *path = sender;
            MDSpaceObject *selectedObject;
            
            if(path.section == 0) {
                selectedObject = self.planets[path.row];
            } else if (path.section == 1){
                selectedObject = self.addedSpaceObject[path.row];
            }
            detailView.spaceObject = selectedObject;
        }
    }
    
    if([segue.destinationViewController isKindOfClass:[MDAddSpaceObjectViewController class]]) {
        MDAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        
        addSpaceObjectVC.delegate  = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if([self.addedSpaceObject count]) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if(section == 1) {
        return [self.addedSpaceObject count];
    } else {
        return [self.planets count];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    if(indexPath.section == 1) {
        
        MDSpaceObject *planet = [self.addedSpaceObject objectAtIndex:indexPath.row];
        
        cell.textLabel.text = planet.name;
        cell.imageView.image = planet.spaceImage;
                
    } else {
    
      MDSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
     
      cell.textLabel.text = planet.name;
      cell.detailTextLabel.text = planet.nickName;
      cell.imageView.image = planet.spaceImage;
    }
    
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

#pragma mark - MDAddSpaceObjectViewControllerDelegate

-(void)addSpaceObject:(id)spaceObject
{
    
    [self.addedSpaceObject addObject:spaceObject];
    MDSpaceObject *addedSpaceObject = self.addedSpaceObject[0];
    NSLog(@"%@", addedSpaceObject.name);
    
    NSLog(@"addd");
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}
-(void)cancelSpaceObject
{
    NSLog(@"cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
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
