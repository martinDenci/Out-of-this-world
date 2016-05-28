//
//  MDOuterSpaceTableViewController.h
//  Out of the world
//
//  Created by Martin Denci on 23/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDAddSpaceObjectViewController.h"

@interface MDOuterSpaceTableViewController : UITableViewController <MDAddSpaceObjectViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *planets;
@property (nonatomic, strong) NSMutableArray *addedSpaceObject;

@end
