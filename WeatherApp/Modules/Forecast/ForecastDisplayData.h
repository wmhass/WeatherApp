//
//  ForecastDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastCurrentConditionDisplayData, ForecastUpcomingConditionDisplayData, ForecastHourlyConditionDisplayData;

@interface ForecastDisplayData : NSObject

- (id _Nonnull)initWithLocationName:(NSString * _Nonnull)locationName currentCondition:(ForecastCurrentConditionDisplayData * _Nonnull)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull)upcomingConditions;

- (NSInteger)numberOfUpcomingConditions;
- (ForecastUpcomingConditionDisplayData * _Nonnull)upcomingConditionDisplayDataAtIndex:(NSInteger)index;
- (NSInteger)numberOfHourlyConditionsForCurrentCondition;
- (ForecastHourlyConditionDisplayData * _Nonnull)hourlyConditionDisplayDataAtIndex:(NSInteger)index;
- (NSString * _Nonnull)currentLocation;
- (NSString * _Nonnull)currentWeatherDescription;
- (NSString * _Nonnull)currentTemperature;

@end