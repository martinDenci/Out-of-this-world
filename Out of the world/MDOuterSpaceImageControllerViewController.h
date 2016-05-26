//
//  MDOuterSpaceImageControllerViewController.h
//  Out of the world
//
//  Created by Martin Denci on 26/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDSpaceObject.h"

@interface MDOuterSpaceImageControllerViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) MDSpaceObject *spaceObject;

@end
