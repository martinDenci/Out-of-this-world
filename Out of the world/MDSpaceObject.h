//
//  MDSpaceObject.h
//  Out of the world
//
//  Created by Martin Denci on 24/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MDSpaceObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float gravitationForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temparature;
@property (nonatomic) int numberOfMoons;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *intrestFact;

@property (nonatomic, strong) UIImage *image;

-(id)initWithData: (NSDictionary *)data andImage:(UIImage *)image;

@end
