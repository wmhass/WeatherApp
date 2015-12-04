//
//  ForecastDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastCurrentConditionDisplayData, ForecastUpcomingConditionDisplayData;
@interface ForecastDisplayData : NSObject

// TODO: Replace this properties for getters/setters methods
@property (strong, nonatomic, readonly) ForecastCurrentConditionDisplayData *currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingConditionDisplayData *> *upcomingConditions;

- (id)initWithCurrentCondition:(ForecastCurrentConditionDisplayData *)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> *)upcomingConditions;

@end
