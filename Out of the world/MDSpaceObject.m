//
//  MDSpaceObject.m
//  Out of the world
//
//  Created by Martin Denci on 24/05/16.
//  Copyright © 2016 Martin Denci. All rights reserved.
//

#import "MDSpaceObject.h"
#import "AstronomicalData.h"

@implementation MDSpaceObject



-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

-(id)initWithData: (NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temparature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] integerValue];
    self.intrestFact = data[PLANET_INTERESTING_FACT];
    self.nickName = data[PLANET_NICKNAME];
    self.spaceImage = image;
    
    return self;
    
}

@end
