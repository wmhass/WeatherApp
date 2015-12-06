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

- (id )initWithDictionary:(NSDictionary * )dictionary {
    self = [super init];
    if (self) {
        _feelsLikeC = @([dictionary[@"FeelsLikeC"] floatValue]);
        _feelsLikeF = @([dictionary[@"FeelsLikeF"] floatValue]);
        _tempC = @([dictionary[@"temp_C"] floatValue]);
        _tempF = @([dictionary[@"temp_F"] floatValue]);
        _humidity = @([dictionary[@"humidity"] floatValue]);
        _observationTime = dictionary[@"observation_time"];
        _weatherDescription = [[ForecastWeatherDescription alloc] initWithValues:dictionary[@"weatherDesc"]];
    }
    return self;
}

@end
