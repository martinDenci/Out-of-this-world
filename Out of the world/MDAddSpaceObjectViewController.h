//
//  MDAddSpaceObjectViewController.h
//  Out of the world
//
//  Created by Martin Denci on 28/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDSpaceObject.h"

@protocol MDAddSpaceObjectViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject:(MDSpaceObject *)spaceObject;
-(void)cancelSpaceObject;

@end

@interface MDAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <MDAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;



- (IBAction)addButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;



@end
