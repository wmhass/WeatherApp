//
//  City.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "City.h"

@implementation City


#pragma mark - Initializers

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dictionary {
    self = [super init];
    if(self) {
        
        _country = dictionary[@"country"][0][@"value"];
        _city = dictionary[@"areaName"][0][@"value"];
        _region = dictionary[@"region"][0][@"value"];
        _latitude = dictionary[@"latitude"];
        _longitude = dictionary[@"longitude"];
        
    }
    return self;
}


@end
