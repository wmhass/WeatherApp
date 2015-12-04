//
//  ForecastHourlyCondition.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastHourlyCondition.h"

@implementation ForecastHourlyCondition

#pragma mark - Initializers

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _tempF = @([dictionary[@"tempF"] floatValue]);
        _tempC = @([dictionary[@"tempC"] floatValue]);
        _chanceOfRain = @([dictionary[@"chanceofrain"] floatValue]);
        //TODO: Time??
    }
    return self;
}

@end
