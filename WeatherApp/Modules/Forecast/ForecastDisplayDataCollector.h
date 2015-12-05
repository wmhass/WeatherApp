//
//  ForecastDisplayDataCollector.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ForecastDisplayDataCollectorTemperatureMetric) {
    ForecastDisplayDataCollectorTemperatureCelsiusMetric = 0,
    ForecastDisplayDataCollectorTemperatureFarenheitMetric
};

@class ForecastCurrentCondition,ForecastUpcomingCondition, ForecastDisplayData;
@interface ForecastDisplayDataCollector : NSObject

- (id _Nonnull)initWithTemperatureMetric:(ForecastDisplayDataCollectorTemperatureMetric)metric;

- (void)collectLocationName:(NSString * _Nonnull)locationName;
- (void)collectCurrentCondition:(ForecastCurrentCondition * _Nonnull)currentCondition;
- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *_Nonnull)upcomingConditions;
- (ForecastDisplayData *_Nonnull)collectedData;

@end
