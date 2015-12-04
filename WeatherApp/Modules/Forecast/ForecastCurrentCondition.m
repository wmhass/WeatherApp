//
//  ForecastCurrentCondition.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastCurrentCondition.h"
#import "ForecastWeatherDescription.h"

@implementation ForecastCurrentCondition

#pragma mark - Initializers

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _feelsLikeC = dictionary[@"FeelsLikeC"];
        _feelsLikeF = dictionary[@"FeelsLikeF"];
        _tempC = dictionary[@"temp_C"];
        _tempF = dictionary[@"temp_F"];
        _humidity = dictionary[@"humidity"];
        _observationTime = dictionary[@"observation_time"];
        _weatherDescription = [[ForecastWeatherDescription alloc] initWithValues:dictionary[@"weatherDesc"]];
    }
    return self;
}

@end
