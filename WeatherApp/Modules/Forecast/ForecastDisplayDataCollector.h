//
//  ForecastDisplayDataCollector.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastCurrentCondition,ForecastUpcomingCondition, ForecastDisplayData;
@interface ForecastDisplayDataCollector : NSObject

- (void)collectCurrentCondition:(ForecastCurrentCondition * _Nonnull)currentCondition;
- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *_Nonnull)upcomingConditions;
- (ForecastDisplayData *_Nonnull)collectedData;

@end
