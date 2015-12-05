//
//  ForecastDataManagerParameters.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDataManagerParameters.h"

@implementation ForecastDataManagerParameters

#pragma mark - Initializers

- (id _Nonnull)initWithCityName:(NSString * _Nonnull)cityName numberOfDays:(NSNumber * _Nullable)numberOfDays {
    self = [super init];
    if(self) {
        _cityName = cityName;
        _numberOfDays = numberOfDays;
    }
    return self;
}

@end
