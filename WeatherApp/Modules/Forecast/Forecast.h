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

@property (strong, nonatomic, readonly) NSString * _Nonnull locationName;
@property (strong, nonatomic, readonly) ForecastCurrentCondition * _Nonnull currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingCondition *> * _Nonnull upcomingConditions;

- (instancetype _Nonnull)initWithLocationName:(NSString * _Nonnull)locationName CurrentCondition:(ForecastCurrentCondition * _Nonnull)currentCondition upcomingConditions:(NSArray <ForecastUpcomingCondition *> * _Nonnull)upcomingConditions;

@end
