//
//  ForecastCurrentConditionDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastHourlyConditionDisplayData;
@interface ForecastCurrentConditionDisplayData : NSObject

@property (strong, nonatomic) NSString * _Nullable tempC;
@property (strong, nonatomic) NSString * _Nullable tempF;
@property (strong, nonatomic) NSString * _Nullable feelsLikeC;
@property (strong, nonatomic) NSString * _Nullable feelsLikeF;
@property (strong, nonatomic) NSString * _Nullable humidity;
@property (strong, nonatomic) NSString * _Nullable observationTime;
@property (strong, nonatomic) NSString * _Nullable weatherDescription;
@property (strong, nonatomic) NSArray <ForecastHourlyConditionDisplayData *> *  _Nullable hourlyConditions;

@end
