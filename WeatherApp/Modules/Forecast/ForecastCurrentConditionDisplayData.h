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

@property (strong, nonatomic) NSString *tempC;
@property (strong, nonatomic) NSString *tempF;
@property (strong, nonatomic) NSString *feelsLikeC;
@property (strong, nonatomic) NSString *feelsLikeF;
@property (strong, nonatomic) NSString *humidity;
@property (strong, nonatomic) NSString *observationTime;
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSArray <ForecastHourlyConditionDisplayData *> *hourlyConditions;

@end
