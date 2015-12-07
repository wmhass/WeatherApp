//
//  UserLocation.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UserLocation.h"

@implementation UserLocation

#pragma mark - Intitilaizers

- (id)initWithLatitude:(double)latitude longitude:(double)longitude {
    self = [super init];
    if (self) {
        _latitude = [NSString stringWithFormat:@"%.4f",latitude];
        _longitude = [NSString stringWithFormat:@"%.4f",longitude];
    }
    return self;
}

@end
