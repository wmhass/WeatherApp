//
//  ForecastDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayData.h"
#import "ForecastUpcomingConditionDisplayData.h"
#import "ForecastCurrentConditionDisplayData.h"
#import "ForecastHourlyConditionDisplayData.h"

@interface ForecastDisplayData()

@property (strong, nonatomic) NSString * _Nonnull locationName;
@property (strong, nonatomic) ForecastCurrentConditionDisplayData * _Nonnull currentCondition;
@property (strong, nonatomic) NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull upcomingConditions;


@end

@implementation ForecastDisplayData

#pragma mark - Intializer

- (id _Nonnull)initWithCurrentCondition:(ForecastCurrentConditionDisplayData * _Nonnull)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull)upcomingConditions {
    self = [super init];
    if (self) {
        _currentCondition = currentCondition;
        _upcomingConditions = upcomingConditions;
    }
    return self;
}


#pragma mark - Public

- (NSInteger)numberOfUpcomingConditions {
    return self.upcomingConditions.count;
}

- (ForecastUpcomingConditionDisplayData * _Nonnull)upcomingConditionDisplayDataAtIndex:(NSInteger)index {
    return self.upcomingConditions[index];
}

- (NSInteger)numberOfHourlyConditionsForCurrentCondition {
    return self.currentCondition.hourlyConditions.count;
}

- (ForecastHourlyConditionDisplayData * _Nonnull)hourlyConditionDisplayDataAtIndex:(NSInteger)index {
    return self.currentCondition.hourlyConditions[index];
}

- (NSString *)currentLocation {
    return self.locationName;
}

- (NSString *)currentWeatherDescription {
    return self.currentCondition.weatherDescription;
}

- (NSString *)currentTemperature {
    return self.currentCondition.temp;
}

@end
