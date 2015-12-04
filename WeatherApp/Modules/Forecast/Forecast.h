//
//  Forecast.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastCurrentCondition, ForecastUpcomingCondition;
@interface Forecast : NSObject

@property (strong, nonatomic, readonly) ForecastCurrentCondition * _Nullable currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingCondition *> * _Nullable upcomingConditions;

- (instancetype _Nonnull)initWithCurrentCondition:(ForecastCurrentCondition * _Nullable)currentCondition upcomingConditions:(NSArray <ForecastUpcomingCondition *> * _Nullable)upcomingConditions;

@end
