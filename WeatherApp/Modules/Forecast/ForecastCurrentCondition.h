//
//  ForecastCurrentCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastWeatherDescription.h"

@class ForecastHourlyCondition;
@interface ForecastCurrentCondition : NSObject

@property (strong, nonatomic) NSNumber * _Nullable tempC;
@property (strong, nonatomic) NSNumber * _Nullable tempF;
@property (strong, nonatomic) NSNumber * _Nullable feelsLikeC;
@property (strong, nonatomic) NSNumber * _Nullable feelsLikeF;
@property (strong, nonatomic) NSNumber * _Nullable humidity;
@property (strong, nonatomic) NSString * _Nullable observationTime;
@property (strong, nonatomic) ForecastWeatherDescription * _Nullable weatherDescription;
@property (strong, nonatomic) NSArray <ForecastHourlyCondition *> * _Nullable hourlyConditions;

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nullable)dictionary;

@end