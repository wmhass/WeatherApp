//
//  Forecast.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "Forecast.h"

@implementation Forecast

#pragma mark - Initializers

- (instancetype )initWithCurrentCondition:(ForecastCurrentCondition * )currentCondition upcomingConditions:(NSArray <ForecastUpcomingCondition *> * )upcomingConditions {
    self = [super init];
    if(self) {
        _currentCondition = currentCondition;
        _upcomingConditions = upcomingConditions;
    }
    return self;
}

@end
