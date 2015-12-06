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

@property (strong, nonatomic, readonly) ForecastCurrentCondition *  currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingCondition *> *  upcomingConditions;

- (instancetype )initWithCurrentCondition:(ForecastCurrentCondition * )currentCondition upcomingConditions:(NSArray <ForecastUpcomingCondition *> * )upcomingConditions;

@end
