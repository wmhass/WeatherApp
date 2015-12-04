//
//  ForecastDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayData.h"

@implementation ForecastDisplayData

- (id)initWithCurrentCondition:(ForecastCurrentConditionDisplayData *)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> *)upcomingConditions {
    self = [super init];
    if (self) {
        _currentCondition = currentCondition;
        _upcomingConditions = upcomingConditions;
    }
    return self;
}
@end
