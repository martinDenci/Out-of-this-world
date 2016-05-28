//
//  MDAddSpaceObjectViewController.m
//  Out of the world
//
//  Created by Martin Denci on 28/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import "MDAddSpaceObjectViewController.h"


@interface MDAddSpaceObjectViewController ()

@end

@implementation MDAddSpaceObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)addButton:(UIButton *)sender {
    
    MDSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self.delegate cancelSpaceObject];
}

-(MDSpaceObject *)returnNewSpaceObject
{
    MDSpaceObject *newSpaceObject = [[MDSpaceObject alloc] init];
    
    newSpaceObject.name = self.nameTextField.text;
    newSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return newSpaceObject;
}


@end
