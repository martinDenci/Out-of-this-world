//
//  MDOuterSpaceDetailViewController.h
//  Out of the world
//
//  Created by Martin Denci on 26/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDSpaceObject.h"

@interface MDOuterSpaceDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MDSpaceObject *spaceObject;

@end
