//
//  ForecastDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayData.h"

@implementation ForecastDisplayData

#pragma mark - Intializer

- (id _Nonnull)initWithLocationName:(NSString * _Nonnull)locationName currentCondition:(ForecastCurrentConditionDisplayData * _Nonnull)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull)upcomingConditions {
    self = [super init];
    if (self) {
        _currentCondition = currentCondition;
        _upcomingConditions = upcomingConditions;
        _locationName = locationName;
    }
    return self;
}
@end
