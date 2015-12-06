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

- (id )initWithTemperatureMetric:(ForecastDisplayDataCollectorTemperatureMetric)metric;

- (void)collectCurrentCondition:(ForecastCurrentCondition * )currentCondition;
- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *)upcomingConditions;
- (ForecastDisplayData *)collectedData;

@end
