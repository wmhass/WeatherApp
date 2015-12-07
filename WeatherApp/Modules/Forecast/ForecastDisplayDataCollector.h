//
//  ForecastDisplayDataCollector.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastDisplayData.h"

@class ForecastCurrentCondition,ForecastUpcomingCondition, ForecastDisplayData;
@interface ForecastDisplayDataCollector : NSObject

- (id )initWithTemperatureMetric:(ForecastDisplayDataTemperatureMetric)metric;

- (void)collectCurrentCondition:(ForecastCurrentCondition * )currentCondition;
- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *)upcomingConditions;
- (ForecastDisplayData *)collectedData;

@end
