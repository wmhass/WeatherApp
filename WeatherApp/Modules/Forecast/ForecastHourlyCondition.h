//
//  ForecastHourlyCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastWeatherDescription.h"

@interface ForecastHourlyCondition : NSObject

@property (strong, nonatomic) NSNumber * _Nullable tempC;
@property (strong, nonatomic) NSNumber * _Nullable tempF;
@property (strong, nonatomic) NSNumber * _Nullable chanceOfRain;
@property (strong, nonatomic) NSString * _Nullable time; // TODO: Check this

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nullable)dictionary;

@end