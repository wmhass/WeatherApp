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
@property (strong, nonatomic, readonly) NSString * _Nonnull locationName;
@property (strong, nonatomic, readonly) ForecastCurrentConditionDisplayData * _Nonnull currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull upcomingConditions;

- (id _Nonnull)initWithLocationName:(NSString * _Nonnull)locationName currentCondition:(ForecastCurrentConditionDisplayData * _Nonnull)currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> * _Nonnull)upcomingConditions;

@end
