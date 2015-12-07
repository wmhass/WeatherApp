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

@property (strong, nonatomic, readonly) ForecastCurrentConditionDisplayData *currentCondition;
@property (strong, nonatomic, readonly) NSArray <ForecastUpcomingConditionDisplayData *> *upcomingConditions;


- (id )initWithCurrentCondition:(ForecastCurrentConditionDisplayData * )currentCondition upcomingConditions:(NSArray <ForecastUpcomingConditionDisplayData *> * )upcomingConditions;

- (NSInteger)numberOfUpcomingConditions;
- (ForecastUpcomingConditionDisplayData * )upcomingConditionDisplayDataAtIndex:(NSInteger)index;
- (NSInteger)numberOfHourlyConditionsForCurrentCondition;
- (ForecastHourlyConditionDisplayData * )hourlyConditionDisplayDataAtIndex:(NSInteger)index;

- (NSString * )currentWeatherDescription;
- (NSString * )currentTemperature;

@end